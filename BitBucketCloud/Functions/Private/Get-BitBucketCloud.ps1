function Get-BitBucketCloud {
    [CmdletBinding()]
    param()

    if (-Not (Test-BitBucketCloud)) {
        throw 'Credentials not set. Please use Set-BitBucketCloud first.'
    }

    @{
        User  = $script:BitBucketCloudUser
        Token = $script:BitBucketCloudToken
        Team  = $script:BitBucketCloudTeam
    }
}