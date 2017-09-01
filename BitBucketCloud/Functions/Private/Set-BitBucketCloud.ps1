function Set-BitBucketCloud {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $User
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Token
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Team = ''
    )

    $script:BitBucketCloudUser  = $User
    $script:BitBucketCloudToken = $Token
    $script:BitBucketCloudTeam  = $Team
}
