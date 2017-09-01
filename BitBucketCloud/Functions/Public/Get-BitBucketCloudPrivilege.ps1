function Get-BitBucketCloudPrivilege {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Team
    )

    if (-Not $PSBoundParameters.ContainsKey('Team')) {
        $Team = (Get-BitBucketCloud).Team
    }

    $Values = Invoke-BitBucketCloudApi -ApiVersion 1.0 -Path "/privileges/$Team"

    foreach ($Privilege in $Values) {
        [pscustomobject]@{
            Repository = $Privilege.repo
            Privilege  = $Privilege.privilege
            User       = $Privilege.user.username
        }
    }
}