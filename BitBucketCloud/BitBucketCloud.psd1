@{
    RootModule = 'BitBucketCloud.psm1'
    ModuleVersion = '0.3.0'
    GUID = 'bd342995-e2aa-42f5-b33e-447c4886250b'
    Author = 'Nicholas Dille'
    #CompanyName = ''
    Copyright = '(c) 2017 Nicholas Dille. All rights reserved.'
    Description = 'Cmdlets for Atlassian BitBucket Cloud'
    # PowerShellVersion = ''
    RequiredModules = @(
        @{
            ModuleName = 'Helpers'
            RequiredVersion = '0.4.0.24'
        }
    )
    FunctionsToExport = @(
        'Set-BitBucketCloud'

        'Add-BitBucketCloudGroup'
        'Get-BitBucketCloudGroup'
        'Remove-BitBucketCloudGroup'

        'Add-BitBucketCloudMember'
        'Get-BitBucketCloudMember'
        'Remove-BitBucketCloudMember'

        'Get-BitBucketCloudPrivilege'
        'Block-BitBucketCloudUser'

        'Get-BitBucketCloudRepository'
    )
    CmdletsToExport = @()
    VariablesToExport = '*'
    AliasesToExport = @()
    #FormatsToProcess = @()
    PrivateData = @{
        PSData = @{
            # Tags = @()
            # LicenseUri = ''
            # ProjectUri = ''
            # ReleaseNotes = ''
        }
    }
}

