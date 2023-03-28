oh-my-posh --init --shell pwsh --config 'C:\Users\jona94h4\AppData\Local\Programs\oh-my-posh\themes\marcduiker.omp.json' | Invoke-Expression

Import-Module -Name Terminal-Icons

function Set-ProfileFile{
   Notepad $profile
}
Set-Alias spf Set-ProfileFile

function Start-AllVM{
   get-vm | Where-Object -Property State -Like off | Select-Object -ExpandProperty name | Start-vm
}
Set-Alias savm Start-AllVM

function Stop-AllVM{
   get-vm | Where-Object -Property State -Like running | Select-Object -ExpandProperty name | Stop-vm -Force
}
Set-Alias sovm Stop-AllVM

Set-Alias gvm Get-vm

Function Get-PubIP {
 (Invoke-WebRequest http://ifconfig.me/ip ).Content
}

Set-Alias gpi Get-PubIP

Function Get-Pass {
-join(48..57+65..90+97..122|ForEach-Object{[char]$_}|Get-Random -C 30)
}

Set-Alias gup Get-Uptime

function Reload-Profile {
        & $profile
}

Set-Alias rep Reload-Profile

function Find-File($name) {
        ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
                $place_path = $_.directory
                echo "${place_path}\${_}"
        }
}

Set-Alias ff Find-file

function Unzip-File ($file) {
        $dirname = (Get-Item $file).Basename
        echo("Extracting", $file, "to", $dirname)
        New-Item -Force -ItemType directory -Path $dirname
        expand-archive $file -OutputPath $dirname -ShowProgress
}

Set-Alias uf Unzip-file

Function Set-WallPaper($Value)

{

 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value

 rundll32.exe user32.dll, UpdatePerUserSystemParameters

}

Set-Alias sw Set-Wallpaper



cls