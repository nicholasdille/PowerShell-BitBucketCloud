function Set-BitBucketCloud {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $User
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Token
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Team = ''
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
        if ($Force -or $PSCmdlet.ShouldProcess("Update credentials to use team '$Team' and user '$User'?")) {
            $script:BitBucketCloudUser  = $User
            $script:BitBucketCloudToken = $Token
            $script:BitBucketCloudTeam  = $Team
        }
    }
}
