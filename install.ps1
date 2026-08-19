# dev-co-pilot installer (Windows / PowerShell)
#
# Usage:
#   .\install.ps1            # install to user scope ($HOME\.codebuddy\skills), available everywhere
#   .\install.ps1 -Project   # install to current project (.codebuddy\skills), repo-scoped

param(
    [switch]$Project
)

$ErrorActionPreference = "Stop"

$SkillName = "dev-co-pilot"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillSrc = Join-Path $ScriptDir ".codebuddy\skills\$SkillName"

$Mode = if ($Project) { "project" } else { "user" }

if ($Mode -eq "user") {
    $Dest = Join-Path $HOME ".codebuddy\skills\$SkillName"
} else {
    $Dest = Join-Path (Get-Location) ".codebuddy\skills\$SkillName"
}

if (-not (Test-Path $SkillSrc)) {
    Write-Host "ERROR: skill source not found at $SkillSrc" -ForegroundColor Red
    exit 1
}

if (Test-Path $Dest) {
    Write-Host "Skill already exists at $Dest"
    $answer = Read-Host "Overwrite? [y/N]"
    if ($answer -ne "y" -and $answer -ne "Y") {
        Write-Host "Aborted."
        exit 0
    }
    Remove-Item -Recurse -Force $Dest
}

$DestParent = Split-Path -Parent $Dest
New-Item -ItemType Directory -Force -Path $DestParent | Out-Null
Copy-Item -Recurse $SkillSrc $Dest

Write-Host ""
Write-Host "Installed dev-co-pilot skill:"
Write-Host "  scope: $Mode"
Write-Host "  path : $Dest"
Write-Host ""
Write-Host "Done. Restart or reload your AI assistant to activate."
