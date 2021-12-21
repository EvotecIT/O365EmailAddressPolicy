Describe -Name 'Testing Get-EmailAddress' {
    It 'Tests single email template against first name and last name' {

        $Output = Get-EmailAddress -FirstName 'Przemysław' -LastName 'Kłys' -EmailTemplate "%g%s@evotec.xyz" -ToLower
        $Output | Should -Be 'przemyslawklys@evotec.xyz'
    }
    It 'Tests multiple email templates against first name and last name' {

        $EmailTemplate = @(
            "%g.%s@evotec.xyz"  # would give przemyslaw.klys@evotec.xyz
            "%1g.%s@evotec.xyz" # would give p.klys@evotec.xyz
            "%1g%s@evotec.xyz"  # would give pklys@evotec.xyz
            "%3g.%s@evotec.xyz" # would give prz.klys@evotec.xyz
            "%g.%1s@evotec.xyz" # would give przemyslaw.k@evotec.xyz
            "%g@company.pl"     # would give przemyslaw@company.pl
            "%g%s@evotec.xyz"   # would give przemyslawklys@evotec.xyz
        )

        $Output = Get-EmailAddress -FirstName 'Przemysław' -LastName 'Kłys' -EmailTemplate $EmailTemplate -ToLower
        $Output.Count | Should -Be 7

        $Output[0] | Should -Be 'przemyslaw.klys@evotec.xyz'
        $Output[1] | Should -Be 'p.klys@evotec.xyz'
        $Output[2] | Should -Be 'pklys@evotec.xyz'
        $Output[3] | Should -Be 'prz.klys@evotec.xyz'
        $Output[4] | Should -Be 'przemyslaw.k@evotec.xyz'
        $Output[5] | Should -Be 'przemyslaw@company.pl'
        $Output[6] | Should -Be 'przemyslawklys@evotec.xyz'

    }
    It 'Tests multiple email templates against first name and last name with spaces' {
        $EmailTemplate = @(
            "%g.%s@evotec.xyz"  # would give przemyslaw.klys@evotec.xyz
            "%1g.%s@evotec.xyz" # would give p.klys@evotec.xyz
            "%1g%s@evotec.xyz"  # would give pklys@evotec.xyz
            "%3g.%s@evotec.xyz" # would give prz.klys@evotec.xyz
            "%g.%1s@evotec.xyz" # would give przemyslaw.k@evotec.xyz
            "%g@company.pl"     # would give przemyslaw@company.pl
            "%g%s@evotec.xyz"   # would give przemyslawklys@evotec.xyz
        )

        $Output = Get-EmailAddress -FirstName 'Przemysław Adam' -LastName 'Kłys' -EmailTemplate $EmailTemplate -ToLower
        $Output.Count | Should -Be 7

        $Output[0] | Should -Be 'przemyslawadam.klys@evotec.xyz'
        $Output[1] | Should -Be 'p.klys@evotec.xyz'
        $Output[2] | Should -Be 'pklys@evotec.xyz'
        $Output[3] | Should -Be 'prz.klys@evotec.xyz'
        $Output[4] | Should -Be 'przemyslawadam.k@evotec.xyz'
        $Output[5] | Should -Be 'przemyslawadam@company.pl'
        $Output[6] | Should -Be 'przemyslawadamklys@evotec.xyz'
    }
}