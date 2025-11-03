function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression (&starship init powershell)

function sdk {
    param(
        [string]$version
    )
    $packageName = "corretto" + $version + "-jdk"
    scoop reset $packageName
}

Set-Alias -Name c -Value Clear-Host
Set-Alias -Name vi -Value nvim
Set-Alias -Name lg -Value lazygit
Set-Alias -Name gs -Value "git status"
Set-Alias -Name gf -Value "git fetch"