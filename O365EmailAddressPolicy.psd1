@{
    AliasesToExport      = @()
    Author               = 'Przemyslaw Klys'
    CmdletsToExport      = @()
    CompanyName          = 'Evotec'
    CompatiblePSEditions = @('Desktop', 'Core')
    Copyright            = '(c) 2020 - 2021 Przemyslaw Klys @ Evotec. All rights reserved.'
    Description          = 'Office 365 Email Address Policy'
    FunctionsToExport    = 'Get-EmailAddressPolicy'
    GUID                 = '303e4cc7-2b05-469a-b700-ab84569a5464'
    ModuleVersion        = '0.0.1'
    PowerShellVersion    = '5.1'
    PrivateData          = @{
        PSData = @{
            Tags = @('Windows')
        }
    }
    RequiredModules      = @(@{
            ModuleVersion = '0.0.214'
            ModuleName    = 'PSSharedGoods'
            Guid          = 'ee272aa8-baaa-4edf-9f45-b6d6f7d844fe'
        })
    RootModule           = 'O365EmailAddressPolicy.psm1'
}