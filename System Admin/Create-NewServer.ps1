
function renameNewSErver 
{
   # Rename the computer and automatically restart the computer so it will take affect
    Rename-Computer -NewName "NameOfNewSErver" -Restart
}

#https://www.youtube.com/watch?v=sfVW1EnMJfo&list=PPSV (Configuring Server 2022)

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

#Get index of your network connection 13:38 
Get-NetAdapter

#Get the ip address information (look for the IPv4 that matches your index) 13:40
Get-NetIPAddress

#test and IP address to make sure its not in use (This should fail)
# (if the computer is already connected  you don't need to do this. Just use the current ip settings) 14:55
Test-Connection 172.25.224.45

#Create a new static IP address 15:39
# It might be easier to get it working with DHCP first then copy the information for the static values
# base the ip address off of what you get from default gateway
New-NetIPAddress -InterfaceIndex 5 -IPAddress 172.25.224.45 -PrefixLength 24 -DefaultGateway 172.25.224.1

#Setup DNS addresses so we can connect to the internet
Set-DnsClientServerAddress -InterfaceIndex 5 -ServerAddresses 8.8.8.8, 8.8.4.4

#Determine if you have IPV6 on 20:05
Get-NetAdapterBinding | Where-Object ComponentID -eq "ms_tcpip6"

#Turn off IPv6 (don't have to do this) 21:05
Disable-NetAdapterBinding -Name "Ethernet" -ComponentID "ms_tcpip6"

#See What time zones are available 23:50
Get-TimeZone -ListAvailable | Where-Object standardname -like "*eastern*"

#Set the time zone 24:49
Set-TimeZone -ID "Eastern Standard Time"

#Get name of Windows Feature feature name of Hyper V 26:00 (Not needed if you know the name)
Get-WindowsFeature

#Install Windows Feature Hyper V  27:30
Install-WindowsFeature -Name "Hyper-V"  ## Couldn't install Hyper V because no virtualization possible
Install-WindowsFeature -Name "RSAT-Hyper-V-Tools" -Restart

#Create a new Virtual Switch
New-VMSwitch -Name "External" -NetAdapterName "Wi-Fi" -AllowManagementOS:$true


# Start https://www.youtube.com/watch?v=Ccn1rLB4IYY&list=PPSV