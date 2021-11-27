Import-Module .\O365EmailAddressPolicy.psd1 -Force

$EmailTemplate = @(
    "%g%s@evotec.xyz"  # would give przemyslawklys@evotec.xyz
)

Get-EmailAddressPolicy -FirstName 'Przemysław' -LastName 'Kłys' -EmailTemplate $EmailTemplate -ToLower