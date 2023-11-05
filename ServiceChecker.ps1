<#
Service Checker
  a. Have a list (ex: from file, array in script) of services to have running, stopped.
  b. Check computer to see service status, if different from the list, then set the Running or Stopped
  c. Log to file actions taken (Optional)
  d. Send email of log (Optional)


#>

$ServicesFilePath = "C:\scripts\Powershell If Then\Start-FilterRouter.ps1"

$SericesList = Import-Csv -Path  $ServicesFilePath -Delimiter