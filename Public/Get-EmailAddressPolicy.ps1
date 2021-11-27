function Get-EmailAddressPolicy {
    [cmdletBinding()]
    param(
        [string] $FirstName,
        [string] $LastName,
        [string[]] $EmailTemplate,
        [alias('LowerCase')][switch] $ToLowerCase
    )

    $FirstName = Rename-LatinCharacters -String $FirstName
    $LastName = Rename-LatinCharacters -String $LastName
    foreach ($Template in $EmailTemplate) {
        $FullEmail = $Template
        $FullEmail = [regex]::Replace($FullEmail, '%(\d*)g', { param($m) Get-NameSection -Name $FirstName -Number $m.Groups[1].Value })
        if ($LastName) {
            # Last Name exists so we do standard approach
            $FullEmail = [regex]::Replace($FullEmail, '%(\d*)s', { param($m) Get-NameSection -Name $LastName -Number $m.Groups[1].Value })
        } else {
            # Last Name doesn't exists so we remove everything including dot
            $FullEmail = [regex]::Replace($FullEmail, '.%(\d*)s', { param($m) Get-NameSection -Name $LastName -Number $m.Groups[1].Value })
        }
        if ($ToLowerCase) {
            $FullEmail.ToLower()
        } else {
            $FullEmail
        }
    }
}