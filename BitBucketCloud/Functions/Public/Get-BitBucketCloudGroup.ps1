function Get-BitBucketCloudGroup {
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

    $Values = Invoke-BitBucketCloudApi -ApiVersion 1.0 -Path "/groups/$Team"

    foreach ($Group in $Values) {
        [pscustomobject]@{
            Name       = $Group.name
            Permission = $Group.permission
            AutoAdd    = $Group.auto_add
            Owner      = $Group.owner.username
            Members    = $Group.members.username
        }
    }
}