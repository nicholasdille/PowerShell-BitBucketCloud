function Remove-BitBucketCloudGroup {
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

    $GroupObject = Get-BitBucketCloudGroup | Where-Object { $_.Name -like $Group }

    Invoke-BitBucketCloudApi -ApiVersion 1.0 -Path "/groups/$Team/$($GroupObject.Slug)" -Method Delete
}