<p align="center">
  <a href="https://dev.azure.com/evotecpl/O365EmailAddressPolicy/_build/latest?definitionId=18"><img src="https://dev.azure.com/evotecpl/O365EmailAddressPolicy/_apis/build/status/EvotecIT.O365EmailAddressPolicy"></a>
  <a href="https://www.powershellgallery.com/packages/O365EmailAddressPolicy"><img src="https://img.shields.io/powershellgallery/v/O365EmailAddressPolicy.svg"></a>
  <a href="https://www.powershellgallery.com/packages/O365EmailAddressPolicy"><img src="https://img.shields.io/powershellgallery/v/O365EmailAddressPolicy.svg?label=powershell%20gallery%20preview&colorB=yellow&include_prereleases"></a>
  <a href="https://github.com/EvotecIT/O365EmailAddressPolicy"><img src="https://img.shields.io/github/license/EvotecIT/O365EmailAddressPolicy.svg"></a>
</p>

<p align="center">
  <a href="https://www.powershellgallery.com/packages/O365EmailAddressPolicy"><img src="https://img.shields.io/powershellgallery/p/O365EmailAddressPolicy.svg"></a>
  <a href="https://github.com/EvotecIT/O365EmailAddressPolicy"><img src="https://img.shields.io/github/languages/top/evotecit/O365EmailAddressPolicy.svg"></a>
  <a href="https://github.com/EvotecIT/O365EmailAddressPolicy"><img src="https://img.shields.io/github/languages/code-size/evotecit/O365EmailAddressPolicy.svg"></a>
  <a href="https://www.powershellgallery.com/packages/O365EmailAddressPolicy"><img src="https://img.shields.io/powershellgallery/dt/O365EmailAddressPolicy.svg"></a>
</p>

<p align="center">
  <a href="https://twitter.com/PrzemyslawKlys"><img src="https://img.shields.io/twitter/follow/PrzemyslawKlys.svg?label=Twitter%20%40PrzemyslawKlys&style=social"></a>
  <a href="https://evotec.xyz/hub"><img src="https://img.shields.io/badge/Blog-evotec.xyz-2A6496.svg"></a>
  <a href="https://www.linkedin.com/in/pklys"><img src="https://img.shields.io/badge/LinkedIn-pklys-0077B5.svg?logo=LinkedIn"></a>
</p>

# O365EmailAddressPolicy - PowerShell Module

**O365EmailAddressPolicy** PowerShell module replicates Exchange On-Premise functionality when it comes to Email Address Policy allowing cloud-only environments. Office 365 doesn't provide an option to autogenerate email addresses for users. This module enables the creation of email addresses for users based on their first name and last name.

## Installing

Everyone can install this module from **PowerShellGallery** hosted by Microsoft. It's recommended way to work with the module.
Version on **PowershellGallery** is optimized for speed and signed. Using code from **GitHub** is **recommended for development**.

```powershell
Install-Module -Name O365Essentials -AllowClobber -Force
```

Force and AllowClobber aren't necessary, but they do skip errors in case some appear.

## Updating

```powershell
Update-Module -Name O365Essentials
```

That's it. Whenever there's a new version, you run the command, and you can enjoy it. Remember that you may need to close, reopen PowerShell session if you have already used module before updating it.

**The essential thing** is if something works for you on production, keep using it till you test the new version on a test computer. I do changes that may not be big, but big enough that auto-update may break your code. For example, small rename to a parameter and your code stops working! Be responsible!

## Usage


```powershell
# will give przemyslawklys@evotec.xyz
Get-EmailAddress -FirstName 'Przemysław' -LastName 'Kłys' -EmailTemplate "%g%s@evotec.xyz" -ToLower
```

```powershell
$EmailTemplate = @(
    "%g.%s@evotec.xyz"  # will give przemyslaw.klys@evotec.xyz
    "%1g.%s@evotec.xyz" # will give p.klys@evotec.xyz
    "%1g%s@evotec.xyz"  # will give pklys@evotec.xyz
    "%3g.%s@evotec.xyz" # will give prz.klys@evotec.xyz
    "%g.%1s@evotec.xyz" # will give przemyslaw.k@evotec.xyz
    "%g@company.pl"     # will give przemyslaw@company.pl
)

Get-EmailAddress -FirstName 'Przemysław' -LastName 'Kłys' -EmailTemplate $EmailTemplate -ToLower
```