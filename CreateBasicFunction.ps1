
#--------Get the script working in the shell (This is just example of working script) ----------
Get-CimInstance -class Win32_LogicalDisk -Filter "DeviceID='C:'" -ComputerName 'Localhost'

#---------------- Choose values to replace with variable ------------
[string]$ComputerName='localhost'# These are default values for parameters 
[string]$Drive='c:' # These are default values for parameters 

Get-CimInstance -Class Win32_LogicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName

#----------------- Paramerterize your variables -------------------
[CmdletBinding()] #This standard pamamters to your your script automatically
param( # Adding this parameter block around the variable changes them into variables
  [string]$ComputerName = 'localhost',
  [string]$Drive = 'c:'
)

Get-CimInstance -Class Win32_LogicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName

#------------- Create a function----------------
function Test-Function{ # Add the function block around your script to create a function
[CmdletBinding()] 
param(
  [string]$ComputerName = 'localhost', 
  [string]$Drive = 'c:' 
)

Get-CimInstance -Class Win32_LogicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName

}

Test-Function # This calls the function. Without it will not run from this script. 



#------------------  Make parameters mandatory ---------------
function Test-Function{
  [CmdletBinding()] 
  param( 
    [Parameter(Mandatory=$true)] # This makes the following parameter mandatory. Make sure it doesn't have default value. Think of this on the same line as the parameter 
    [string]$ComputerName, 
    [string]$Drive = 'c:' 
  )
  
  Get-CimInstance -Class Win32_LogicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName
  
  }

  Test-Function  


#Left off at 2.11




















<#

Get-CimInstance -class Win32_LogicalDisk -Filter "DeviceID='C:'" -ComputerName 'Localhost' | 
  Select-Object PSComputerName, DeviceID,
    @{n='Size(GB)';e={$_.size / 1gb -as [int]}},
    @{n='Free(GB)';e={$_.Freespace /1gb -as [int]}}

#>