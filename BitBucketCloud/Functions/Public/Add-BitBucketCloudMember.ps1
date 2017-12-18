function Add-BitBucketCloudMember {
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
        $Group
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $User
    )

    if (-Not $PSBoundParameters.ContainsKey('Team')) {
        $Team = (Get-BitBucketCloud).Team
    }

    $GroupObject = Get-BitBucketCloudGroup | Where-Object { $_.Name -like $Group }

    Invoke-BitBucketCloudApi -ApiVersion 1.0 -Path "/groups/$Team/$($GroupObject.Slug)/members/$User" -Method Put -Body '{}'
}