<#
.SYNOPSIS
    Windows 11 must be configured to enable Remote host allows delegation of non-exportable credentials.



.NOTES
    Author          : Danny Bruna
    LinkedIn        : https://www.linkedin.com/in/dr-danny-bruna
    GitHub          : https://github.com/DBruna84
    Date Created    : May 10, 2026
    Last Modified   : May 10, 2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000068 
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000068/

.TESTED ON
    Date(s) Tested  : May 10, 2026
    Tested By       : Danny Bruna
    Systems Tested  : Windows 11 Professional 
    PowerShell Ver. : Major-5 Minor-1 Build-26100  Revision-8115

PowerShell Remediation

Run as Administrator:

# Create CredSSP policy path
New-Item `
  -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" `
  -Force | Out-Null

# Enable delegation of non-exportable credentials
Set-ItemProperty `
  -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" `
  -Name "AllowProtectedCreds" `
  -Type DWord `
  -Value 1

Write-Host "WN11-CC-000068 remediated."
Apply Group Policy
gpupdate /force

Verify Configuration
Get-ItemProperty `
  -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" `
  -Name AllowProtectedCreds
