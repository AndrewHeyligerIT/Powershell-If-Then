#Get-Service -Name BITS

function Test-Function{
  [CmdletBinding()] #This standard pamamters to your your script automatically
  param(
    [Parameter(Mandatory=$true)]
    [string]$ComputerName, # These are default values for parameters 
    [string]$Drive = 'c:' # These are default values for parameters 
  )
  
  Get-CimInstance -Class Win32_LogicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName
  
  }
  
  Test-Function # This calls the function. Without it will not run from this script. 