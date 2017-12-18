function Block-BitBucketCloudUser {
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
        $User
    )

    if (-Not $PSBoundParameters.ContainsKey('Team')) {
        $Team = (Get-BitBucketCloud).Team
    }

    $Groups = Get-BitBucketCloudGroup | Where-Object { $_.Members -contains 'zakagreenfield' }
    Foreach ($Group in $Groups) {
        Remove-BitBucketCloudMember -Group $Group.Name -User $User
    }

    $Privileges = Get-BitBucketCloudPrivilege | Where-Object { $_.User -like 'nicholasdille' }
    Foreach ($Privilege in $Privileges) {
        Remove-BitBucketCloudPrivilege -Repository $Privilege.Repository.Substring($Team.Length + 1) -User $User
    }
}