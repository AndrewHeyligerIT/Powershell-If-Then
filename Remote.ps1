#https://www.youtube.com/watch?v=sfVW1EnMJfo&list=PPSV
# Start a remote Session 3:45
New-PSSession -ComputerName JPHYPV2022 -Credential administrator

# Look at what is in our trusted host list 5:15
Get-Item WSMan:\localhost\Client\TrustedHosts | Select-Object value

# Add computer to trusted host that you are not on the same domain 6:13
Set-item WSMan:\localhost\Client\TrustedHosts -Value "JPHYPV2022" -Concatenate -Confirm:$false

# Create new PSSession 7:44
$Session=New-PSSession -ComputerName JPHYPV2022 -Credential administrator

# Enter into the PSSession 8:10
Enter-PSSession -Session $Session

# Enable Remote Desktop 9:17
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

# Setup Firewall rule to enable remote desktop 33:50
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"