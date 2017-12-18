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

    foreach ($Item in $Values) {
        [pscustomobject]@{
            Name       = $Item.name
            Permission = $Item.permission
            AutoAdd    = $Item.auto_add
            Owner      = $Item.owner.username
            Members    = $Item.members.username
            Slug       = $Item.slug
        }
    }
}