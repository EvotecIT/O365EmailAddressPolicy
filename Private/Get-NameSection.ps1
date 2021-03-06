Function Get-NameSection {
    <#
    .SYNOPSIS
    Returns the first $num characters of a name, unless $num is 0, missing or longer than the name, then returns the entire name

    .DESCRIPTION
    Returns the first $num characters of a name, unless $num is 0, missing or longer than the name, then returns the entire name

    .PARAMETER Name
    Provide the name to be parsed

    .PARAMETER Number
    Provide number of chars to trim to

    .EXAMPLE
    Get-NameSection -Name 'przemyslaw' -Number 5

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [string]$Name,
        [int]$Number
    )
    if (-not $Number -or $Number -gt $Name.Length) {
        $Name.Replace(" ", "")
    } else {
        $Name.Substring(0, $Number).Replace(" ", '')
    }
}