###############################################################################
# #  
# #  Invoke-LsView, Split-Ntile, Out-Joined
# #  Copyright (c) 2021 Maxwell Bloch (github.com/maxwellb)
# #  All rights reserved. No warranties of any kind.
# #  -------------------------------------------------------------------------
# #  Supplementary functions and tests are all licensed ISC/MIT.
# #  
  # #
    #######################

function Per {
    param (
        [int] $N,
        [int] $M
    )
    [int][decimal]::Floor($N/$M)
}

function RangeStart {
    param (
        [int] $N,
        [int] $M,
        [int] $I
    )
    $P = Per $N $M
    $R = $N % $P
    0 + (${I}*${P}) + [Math]::Min(${I}, ${R})
}

function RangeEnd {
    param (
        [int] $N,
        [int] $M,
        [int] $I
    )
    $P = Per $N $M
    $R = $N % $P
    (${P}-1) + (${I}*${P}) + [Math]::Min(1+${I}, ${R})
}

function Find-InnerMaxLength {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string[][]]
        $Items
    )
    $max_outer = ${Items} |% `
        -begin { $max_outer = 0 } `
        -process {
            $max_inner = ${_} |% `
                -begin { $max_inner = 0 } `
                -process {
                    $length = ${_}.Length
                    $max_inner = [Math]::Max(${max_inner}, ${length})
                } `
                -end { ${max_inner} }
            $max_outer = [Math]::Max(${max_outer}, ${max_inner})
        } `
        -end { $max_outer }
    ${max_outer}
}

if ($Debug) {
    Write-Host
    Write-Host
    Out-Joined (Get-ChildItem -Path $env:USERPROFILE | Split-Ntile -Partitions 3)
    Get-ChildItem -Path $env:USERPROFILE | Split-Ntile -Partitions 3 | Out-Joined

    Invoke-LsView -Path $env:ProgramFiles

    Set-Alias -Name "lv" -Value "Invoke-LsView"
}
