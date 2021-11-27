Import-Module .\O365EmailAddressPolicy.psd1 -Force

$EmailTemplate = @(
    "%g.%s@evotec.xyz"  # would give przemyslaw.klys@evotec.xyz
    "%1g.%s@evotec.xyz" # would give p.klys@evotec.xyz
    "%1g%s@evotec.xyz"  # would give pklys@evotec.xyz
    "%3g.%s@evotec.xyz" # would give prz.klys@evotec.xyz
    "%g.%1s@evotec.xyz" # would give przemyslaw.k@evotec.xyz
    "%g@company.pl"     # would give przemyslaw@company.pl
)

Get-EmailAddress -FirstName 'Przemysław' -LastName 'Kłys' -EmailTemplate $EmailTemplate -ToLower
#Get-EmailAddress -FirstName 'Adam' -LastName '' -EmailTemplate $EmailTemplate -ToLower
#Get-EmailAddress -LastName 'Kolendo' -EmailTemplate $EmailTemplate -ToLower