function Block-BitBucketCloudUser {
    [CmdletBinding(SupportsShouldProcess,ConfirmImpact='High')]
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
    
    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
    }

    process {
        if (-Not $PSBoundParameters.ContainsKey('Team')) {
            $Team = (Get-BitBucketCloud).Team
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Remove user from all groups?")) {
            $Groups = Get-BitBucketCloudGroup | Where-Object { $_.Members -contains $User }
            Foreach ($Group in $Groups) {
                Remove-BitBucketCloudMember -Group $Group.Name -User $User
            }
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Remove user from all repositories?")) {
            $Privileges = Get-BitBucketCloudPrivilege | Where-Object { $_.User -like $User }
            Foreach ($Privilege in $Privileges) {
                Remove-BitBucketCloudPrivilege -Repository $Privilege.Repository.Substring($Team.Length + 1) -User $User
            }
        }
    }
}
