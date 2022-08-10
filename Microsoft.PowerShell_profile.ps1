# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Oh My Posh Theme
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\capr4n.omp.json" | Invoke-Expression

# Set auto suggestion as you type in Powershell
Set-PSReadLineOption -PredictionSource History


# Keybinds
Set-PSReadLineKeyHandler -Chord Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord Ctrl+n -Function HistorySearchForward
# Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
# Set-PSReadLineOption -PredictionViewStyle ListView


# Colored Directory (can't use this with terminal-icons as it overrides it seems)
# if(-Not (Test-Path Variable:PSise)) { # Only run this in the console and not in the ISE
#   Import-Module Get-ChildItemColor


#   Set-Alias l get-childItem -option AllScope
#   Set-Alias ls get-childItemColorFormatWide -option AllScope
# }

# Terminal Icons (ls)
Import-Module -Name Terminal-Icons
Set-PSReadLineOption -Colors @{
  InlinePrediction = '525252'
  # Selection = '525252'
}

# Swaps CTRL and CAPSLOCK keys via registry (Don't need this uncommented, just noting it to remember)
# $hexified = "00,00,00,00,00,00,00,00,03,00,00,00,1d,00,3a,00,3a,00,1d,00,00,00,00,00".Split(",") | % { "0x$_"};

# $kbLayout = 'HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout';

# New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified)
# References
