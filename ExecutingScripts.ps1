#### Execute Commands ###

# Parenthesis Run a command and pass the value to another command
Get-Service -Name BITS -ComputerName (Get-Content c:\computers.txt)

# Parenthesis Run a comand pass it a value from a csv
Get-Service name BITS -ComputerName (Import-csv c:\computers.csv | Select-Object -ExcludeProperty ComputerName)

# Parenthesis Alternate way to run the above code
Get-Service -name BITS -ComputerName (Import-Csv c:\computers.csv).computername

##### Execute Scripts ###

# To run a script that you are not already in the folder where the script is you must explicitly type the name (if there is a space in the name you have to put an & in front)
& 'C:\scripts\Powershell Avanced Tools Scripts\test.ps1'

# To run a script that you are already in the folder 
.\test.ps1

# Un block files
# This allows to run files you trust irregardless of execution policy
Unblock-File 

# This allows to run files you trust irregardless of execution policy and does it for all files in a folder -Verbose is so you can see what happened
Unblock-File *\* -Verbose


# Load just a function from a script in to the shell to use
<#
  Dot soucing script(doesn't have to be done in ise) = loading the script into the shell so you can call a function directly and not have to runt the whole script. 
  You can put a bunch of functions in a script and use dot sourcing to load them in a shell to use them whenever you want
  If you change the function you have to dot source it again to see the changes

#>
. .\test.ps1 # you have to navigate to the folder of the script 
Test-Function # then you call the function anytime you want in the console