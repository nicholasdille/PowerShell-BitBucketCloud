function Test-BitBucketCloud {
    [CmdletBinding()]
    param()

    $script:BitBucketCloudUser -and $script:BitBucketCloudToken -and $script:BitBucketCloudTeam
}