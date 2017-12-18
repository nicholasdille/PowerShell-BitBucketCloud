function Add-BitBucketCloudPrivilege {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Team
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Repository
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $User
        ,
        [Parameter(Mandatory)]
        [ValidateSet('read','write','admin')]
        [string]
        $Permission
    )

    if (-Not $PSBoundParameters.ContainsKey('Team')) {
        $Team = (Get-BitBucketCloud).Team
    }

    Invoke-BitBucketCloudApi -ApiVersion 1.0 -Path "/privileges/$Team/$Repository/$User" -Method Put -Body "$Permission"
}