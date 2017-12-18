function Remove-BitBucketCloudPrivilege {
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
        $Repository
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

        if ($Force -or $PSCmdlet.ShouldProcess("Remove provilege on repository '$Repository' for user '$User'?")) {
            Invoke-BitBucketCloudApi -ApiVersion 1.0 -Path "/privileges/$Team/$Repository/$User" -Method Delete
        }
    }
}