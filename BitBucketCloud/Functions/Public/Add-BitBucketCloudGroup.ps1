function Add-BitBucketCloudGroup {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Team
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Group
    )

    if (-Not $PSBoundParameters.ContainsKey('Team')) {
        $Team = (Get-BitBucketCloud).Team
    }

    Invoke-BitBucketCloudApi -ApiVersion 1.0 -Path "/groups/$Team" -Method Post -Body "name=$Group"
}