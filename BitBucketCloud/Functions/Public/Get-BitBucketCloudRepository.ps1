function Get-BitBucketCloudRepository {
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

    $Values = Invoke-BitBucketCloudApi -Path "/repositories/$Team"

    foreach ($Repo in $Values) {
        [pscustomobject]@{
            Name    = $Repo.name
            Owner   = $Repo.owner.username
            Project = $Repo.project.name
            Size    = $Repo.size
            Private = $Repo.is_private
            Created = $Repo.created_on
        }
    }
}