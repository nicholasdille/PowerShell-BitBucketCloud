function Get-BitBucketCloudMember {
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

    Get-BitBucketCloudPrivilege | Select-Object -ExpandProperty User -Unique
}