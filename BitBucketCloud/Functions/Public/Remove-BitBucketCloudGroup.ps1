function Remove-BitBucketCloudGroup {
    [CmdletBinding(SupportsShouldProcess,ConfirmImpact='High')]
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

        $GroupObject = Get-BitBucketCloudGroup | Where-Object { $_.Name -like $Group }

        if ($Force -or $PSCmdlet.ShouldProcess("Remove group '$Group'?")) {
            Invoke-BitBucketCloudApi -ApiVersion 1.0 -Path "/groups/$Team/$($GroupObject.Slug)" -Method Delete
        }
    }
}