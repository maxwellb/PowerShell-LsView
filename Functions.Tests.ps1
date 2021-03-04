#Requires -Module @{ ModuleName = 'Pester'; ModuleVersion = '4.0' }

. ${PSScriptRoot}\Functions.ps1

Describe "RangeStart/RangeEnd - Partition 34 into 6" {
    $N = 34
    $M = 6

    #   <>     <>       <>       <>       <>       <>
    #   <>     <>       <>       <>       <>       <>
    #   <>     <>       <>       <>       <>       <>
    #   <>     <>       <>       <>       <>       <>
    #   <>     <>       <>       <>       <>       <>
    #   <>     <>       <>       <>
    # (0..5) (6..11) (12..17) (18..23) (24..28) (29..33)

    It "Ranges from 0..5 at I=0" {
        (RangeStart $N $M 0), (RangeEnd $N $M 0) | Should -Be 0, 5
    }
    It "Ranges from 6..11 at I=1" {
        (RangeStart $N $M 1), (RangeEnd $N $M 1) | Should -Be 6, 11
    }
    It "Ranges from 12..17 at I=2" {
        (RangeStart $N $M 2), (RangeEnd $N $M 2) | Should -Be 12, 17
    }
    It "Ranges from 18..23 at I=3" {
        (RangeStart $N $M 3), (RangeEnd $N $M 3) | Should -Be 18, 23
    }
    It "Ranges from 24..28 at I=4" {
        (RangeStart $N $M 4), (RangeEnd $N $M 4) | Should -Be 24, 28
    }
    It "Ranges from 29..33 at I=5" {
        (RangeStart $N $M 5), (RangeEnd $N $M 5) | Should -Be 29, 33
    }
}

Describe "Split-Ntile - Splits |11| into 2 as |6| and |5|" {
    It "splits `"ABCDEFGHIJK`" as `"ABCDEF`", `"GHIJK`"" {
        $in = @("ABCDEFGHIJK".ToCharArray())
        (${in} | Split-Ntile) | Should -Be @("ABCDEF".ToCharArray()), @("GHIJK".ToCharArray())
    }
    It "splits (1..11) as (1..6), (7..11)" {
        ((1..11) | Split-Ntile) | Should -Be (1..6), (7..11)
    }
}

Describe "Find-InnerMaxLength - Finds the length of the inner object with the maximum length" {
    It "Is 99 in ( [`"z`"] * [(1..10), (40,99,30), (50..70)] )" {
        Find-InnerMaxLength @( `
            ((1..10) |% { "z"*${_} }), `
            ((40,99,30) |% { "z"*${_} }), `
            ((50..70) |% { "z"*${_} }) `
            ) `
            | Should -Be 99
    }
}

