function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

function sdk {
    param(
        [string]$version
    )
    $packageName = "corretto" + $version + "-jdk"
    scoop reset $packageName
}

function Quit-Shell {
    exit
}

Set-Alias -Name c -Value Clear-Host
Set-Alias -Name vi -Value nvim
Set-Alias -Name lg -Value lazygit
Set-Alias -Name gs -Value "git status"
Set-Alias -Name gf -Value "git fetch"
Set-Alias -Name q -Value Quit-Shell


## ALWAYS AT THE END OF FILE
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
