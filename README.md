# LsView

Just a little module for fun.

> ```
> .SYNOPSIS
> A little bit Get-ChildItem, a little bit /bin/ls
> ```

## Invoke-LsView

```powershell
<#
.SYNOPSIS
A little bit Get-ChildItem, a little bit /bin/ls

.DESCRIPTION
This function wraps the names of the items returned by Get-ChildItem into
one or more columns, each flowing into the next. This behavior is similar
to /bin/ls in Linux/BSD userland, or the "List" arrangement in Windows
Explorer.

Try aliasing this to "lv"!

.PARAMETER Path
The path whose items to list

.EXAMPLE
Invoke-LsView [-Path] C:\Windows\System32

.NOTES
    Invoke-LsView - List view in PowerShell.

    Copyright (C) 2021  Maxwell Bloch (github.com/maxwellb)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#>
```

## Out-Joined

```powershell
<#
.SYNOPSIS
Write lists to the host in columns, with some decoration.

.DESCRIPTION
A simple example:

You have two arrays, each with 10 items. Visually, the first array will
be placed vertically to the left, and the second array will be placed
vertically to the right of the first array.

This function is intended to be called on the output of Split-Ntile.

This function iterates over the top of each array to lay out these columns,
but may not gracefully handle arrays which were not formatted to the proper
lengths before being passed to this function.

and will place unbalanced remainder items in the left-most arrays. That is,
the lists on the right will always be equal size or shorter than the list
to its left, and no two lists will differ in length by more than one item.

.PARAMETER Items
An array of arrays, indexed firstly into the vertical lists of items, and
then a regular list of items 

.EXAMPLE
(0..30) | Split-Ntile -Partitions 4 | Out-Joined

  0     8     16    24  
  1     9     17    25
  2     10    18    26
  3     11    19    27
  4     12    20    28  
  5     13    21    29
  6     14    22    30
  7     15    23

.NOTES
    Out-Joined - Write lists to the host in columns, with some decoration.
    
    ISC License (ISC)
    Copyright (C) 2021  Maxwell Bloch (github.com/maxwellb)
    
    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted, provided that the above
    copyright notice and this permission notice appear in all copies.
    
    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#>
```

## Split-Ntile

```powershell
<#
.SYNOPSIS
Splits one list into equal parts.

.DESCRIPTION
This function splits the items into lists of equal size, and provides that
any remainder items are in the first-indexed arrays. In other words, the
smaller arrays will be at the end, and either all arrays will be the same
length, or there will only be two lengths of arrays in the result.

.PARAMETER Partitions
The number of partitions to create among the items. This is the size
of the "outer" array returned.

.PARAMETER Item
The items to split into multiple lists.

.EXAMPLE
(0..10) | Split-Ntile -Partitions 3 | ConvertTo-Json

{
    "value":  [
                  [
                      0,
                      1,
                      2,
                      3
                  ],
                  [
                      4,
                      5,
                      6,
                      7
                  ],
                  [
                      8,
                      9,
                      10
                  ]
              ],
    "Count":  3
}

.NOTES
    Split-Ntile - Partition items into equal length arrays.
    
    ISC License (ISC)
    Copyright (C) 2021  Maxwell Bloch (github.com/maxwellb)
    
    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted, provided that the above
    copyright notice and this permission notice appear in all copies.
    
    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#>
```
