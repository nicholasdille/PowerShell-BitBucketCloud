#requires -Version 4
#requires -Modules Helpers

function Invoke-BitBucketCloudApi {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateSet('1.0', '2.0')]
        [string]
        $ApiVersion = '2.0'
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path
        ,
        [Parameter()]
        [ValidateSet('Delete', 'Get', 'Post', 'Put')]
        [string]
        $Method = 'Get'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [hashtable]
        $Headers = @{}
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Accept = 'application/json'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Body
    )

    if ($Headers.ContainsKey('Accept')) {
        $Headers.Accept = $Accept

    } else {
        $Headers.Add('Accept', $Accept)
    }

    $BitBucket = Get-BitBucketCloud
    $AuthString = Get-BasicAuthentication -User $BitBucket.User -Token $BitBucket.Token
    $Headers.Add('Authorization', "Basic $AuthString")

    if ($ApiVersion -eq '2.0') {
        $Values = @()
        $NextPageUri = "https://api.bitbucket.org/$ApiVersion$Path"
        while ($NextPageUri) {
            $Response = Invoke-WebRequest -Uri $NextPageUri -Method $Method -Headers $Headers
            $Json = $Response.Content | ConvertFrom-Json
            $Values += $Json.values

            $NextPageUri = $Json.next
        }
        $Values

    } elseif ($ApiVersion -eq '1.0') {
        $IwrParams = @{
            Uri     = "https://api.bitbucket.org/$ApiVersion$Path"
            Method  = $Method
            Headers = $Headers
        }
        if ($Body) {
            $IwrParams.Add('Body', $Body)
        }
        $Response = Invoke-WebRequest @IwrParams
        $Json = $Response.Content | ConvertFrom-Json
        $Json
    }
}