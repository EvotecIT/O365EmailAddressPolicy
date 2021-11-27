Function Get-NameSection {
    <#
    .SYNOPSIS
    Returns the first $num characters of a name, unless $num is 0, missing or longer than the name, then returns the entire name

    .DESCRIPTION
    Returns the first $num characters of a name, unless $num is 0, missing or longer than the name, then returns the entire name

    .PARAMETER Name
    Parameter description

    .PARAMETER Number
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [string]$Name,
        [int]$Number
    )
    if (-not $Number -or $Number -gt $Name.Length) {
        $Name
    } else {
        $Name.Substring(0, $Number)
    }
}