@{
    RootModule = 'BitBucketCloud.psm1'
    ModuleVersion = '0.2.1'
    GUID = 'bd342995-e2aa-42f5-b33e-447c4886250b'
    Author = 'Nicholas Dille'
    #CompanyName = ''
    Copyright = '(c) 2017 Nicholas Dille. All rights reserved.'
    Description = 'Cmdlets for Atlassian BitBucket Cloud'
    # PowerShellVersion = ''
    RequiredModules = @(
        @{
            ModuleName = 'WebRequest'
            RequiredVersion = '0.2.0.26'
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

        'Add-BitBucketCloudPrivilege'
        'Get-BitBucketCloudPrivilege'
        'Remove-BitBucketCloudPrivilege'

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

