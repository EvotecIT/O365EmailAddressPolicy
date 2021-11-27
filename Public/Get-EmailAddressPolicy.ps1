function Get-EmailAddressPolicy {
    <#
    .SYNOPSIS
    Generates email address based on given EmailTemplate policy similar to what Exchange On-Premises uses.

    .DESCRIPTION
    Generates email address based on given EmailTemplate policy similar to what Exchange On-Premises uses.

    .PARAMETER FirstName
    Provide first name of the user/account

    .PARAMETER LastName
    Provide last name of the user/account

    .PARAMETER EmailTemplate
    Provide one or more email templates using string similar to what Exchange On-Premises uses.

    - "%g.%s@evotec.xyz"  # would give przemyslaw.klys@evotec.xyz
    - "%1g.%s@evotec.xyz" # would give p.klys@evotec.xyz
    - "%1g%s@evotec.xyz"  # would give pklys@evotec.xyz
    - "%3g.%s@evotec.xyz" # would give prz.klys@evotec.xyz
    - "%g.%1s@evotec.xyz" # would give przemyslaw.k@evotec.xyz
    - "%g@company.pl"         # would give przemyslaw@company.pl


    .PARAMETER ToLowerCase
    Forces generated email addresses to lower case.

    .EXAMPLE
    $EmailTemplate = @(
        "%g.%s@evotec.xyz"  # would give przemyslaw.klys@evotec.xyz
        "%1g.%s@evotec.xyz" # would give p.klys@evotec.xyz
        "%1g%s@evotec.xyz"  # would give pklys@evotec.xyz
        "%3g.%s@evotec.xyz" # would give prz.klys@evotec.xyz
        "%g.%1s@evotec.xyz" # would give przemyslaw.k@evotec.xyz
        "%g@company.pl"         # would give przemyslaw@company.pl
    )

    Get-EmailAddressPolicy -FirstName 'Przemysław' -LastName 'Kłys' -EmailTemplate $EmailTemplate -ToLower

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [string] $FirstName,
        [string] $LastName,
        [parameter(Mandatory)][string[]] $EmailTemplate,
        [alias('LowerCase')][switch] $ToLowerCase
    )

    $FirstName = Rename-LatinCharacters -String $FirstName
    $LastName = Rename-LatinCharacters -String $LastName
    foreach ($Template in $EmailTemplate) {
        $FullEmail = $Template
        if ($FirstName) {
            $FullEmail = [regex]::Replace($FullEmail, '%(\d*)g', { param($m) Get-NameSection -Name $FirstName -Number $m.Groups[1].Value })
        } else {
            $FullEmail = [regex]::Replace($FullEmail, '%(\d*)g.', { param($m) Get-NameSection -Name $FirstName -Number $m.Groups[1].Value })
        }
        if ($LastName) {
            # Last Name exists so we do standard approach
            $FullEmail = [regex]::Replace($FullEmail, '%(\d*)s', { param($m) Get-NameSection -Name $LastName -Number $m.Groups[1].Value })
        } else {
            # Last Name doesn't exists so we remove everything including dot
            $FullEmail = [regex]::Replace($FullEmail, '.%(\d*)s', { param($m) Get-NameSection -Name $LastName -Number $m.Groups[1].Value })
        }
        if ($FullEmail.StartsWith('@')) {
            Write-Warning -Message "Get-EmailAddressPolicy - Couldn't generate email ($FullEmail) from template ($Template). Skipping"
            continue
        }
        if ($ToLowerCase) {
            $FullEmail.ToLower()
        } else {
            $FullEmail
        }
    }
}