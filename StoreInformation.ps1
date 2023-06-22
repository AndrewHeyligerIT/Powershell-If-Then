
###### Lists ######

## Array to store multiple items
$services = Get-Service
$services[0]

### Arrary specify range of numbers
$Services[1..5]




####### Variables  Store data#######

## Create a variable to store information
$MyVar = 2

# Get the output of a variable
$MyVar

# The proper way to output a variable
Write-Output $MyVar

# Specify what type of data the variable will hold
[string]$MyName="Jason"
Write-Output $MyName

# Ask for Data and add it to a variable
[string]$ComputerName =Read-Host "Enter Computer Name"

Write-Output $ComputerName

# Use type to open up more parameters and methods for a variable
[datetime]$d = "12/25/2013"
$d.Day
$d.DayOfWeek

# VALIDATE what type of values are allowed for your variable

[ValidateSet("a","b","c")][string]$x = "a"

