#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	FortiEMS-Check.ps1
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
# Begin Processing
#
###############################################################################################################################################
#
$ExitCode=0 # Setting ExitCode Variable to an initial 0
#
& "C:\Program Files\Fortinet\FortiClient\FortiESNAC.exe" -d | Select-String -Pattern Status | Tee-Object -Variable Status
#
If ("$Status" -eq '')
{
	write-host 'Host NOT Connected'
	$ExitCode++
}
#
Write-Host Exiting with exit code $ExitCode
exit $ExitCode
