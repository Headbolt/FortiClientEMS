#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	FortiEMS-Remediate.ps1
#	https://github.com/Headbolt/FortiClientEMS
#
#   This Script is designed check registration status to a FortiClient EMS Server
#	and then exit with an appropriate Exit code.
#
#	Intended use is in Microsoft Endpoint Manager, as the "Check" half of a Proactive Remediation Script
#	The "Remediate" half is found here https://github.com/Headbolt/Maconomy_Shortcut_Remediatehttps://github.com/Headbolt/FortiClientEMS
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 14/03/2025
#
#	14/03/2025 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
$global:LocalLogFilePath="$Env:WinDir\temp\FortiClient-EMS-Registration.log" # Set LogFile
$global:ServerKey="put code or url here" # Set Invite code or server url
$global:ScriptName="Application | FortiClient EMS Registration"
#
###############################################################################################################################################
#
#   Functions Definition
#
###############################################################################################################################################
#
#   Logging Function
#
function Logging
{
#	
Start-Transcript $global:LocalLogFilePath # Start the logging
Clear-Host # Clear Screen
SectionEnd
Write-Host "Logging to $global:LocalLogFilePath"
#
}     
#
###############################################################################################################################################
#
# Section End Function
#
function SectionEnd
{
#
Write-Host '' # Outputting a Blank Line for Reporting Purposes
Write-Host  '-----------------------------------------------' # Outputting a Dotted Line for Reporting Purposes
Write-Host '' # Outputting a Blank Line for Reporting Purposes
#
}
#
###############################################################################################################################################
#
# Script End Function
#
Function ScriptEnd
{
#
Write-Host Ending Script $global:ScriptName
Write-Host '' # Outputting a Blank Line for Reporting Purposes
Write-Host  '-----------------------------------------------' # Outputting a Dotted Line for Reporting Purposes
Write-Host ''# Outputting a Blank Line for Reporting Purposes
#
Stop-Transcript # Stop Logging
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
# 
# Begin Processing
#
###############################################################################################################################################
#
SectionEnd
Logging
SectionEnd
#
write-host 'Checking Status'
& "C:\Program Files\Fortinet\FortiClient\FortiESNAC.exe" -d | Select-String -Pattern Status | Tee-Object -Variable Status
#
If ("$Status" -eq '')
{
	Write-Host '' # Outputting a Blank Line for Reporting Purposes
	Write-Host 'Running Command'
	Write-Host '"C:\Program Files\Fortinet\FortiClient\FortiESNAC.exe"' -r $global:ServerKey
	& "C:\Program Files\Fortinet\FortiClient\FortiESNAC.exe" -r $global:ServerKey
}
#
SectionEnd
ScriptEnd
