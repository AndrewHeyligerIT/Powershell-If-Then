function Verb-Noun {
  [CmdletBinding()]
  param (
    [parameter(ValueFromPipeline=$true)]
    [int]$Mystring
    #[Parameter()][Int]$MyInt
  )
  
  begin {
    <#code#>
    "Begin $Mystring"
  }
  
  process {
    <#code#>
    "Proces $Mystring"
  }
  
  end {
    <#code#>
    "End $Mystring"
  }
}


function Get-CompInfo {
  [CmdletBinding()]
  param (
    #Want to support mulltiple computers
    [String[]]$ComputerName,
    #Swtich to turn on Error loggin
    [Switch]$ErrorLog,
    [String]$LogFile = 'c:\errorlog.txt'
  )
  Begin{
    If($ErrorLog){
        Write-Verbose 'Error logging turned on'
  }Else{
    Write-Verbose 'Error logging turned off'  
  }
  ForEach($C in $ComputerName){
    Write-Verbose "Computer: $C"
    }  
  }
  Process{}
  End{}
  
}










<#

  function Verb-Noun {
  [CmdletBinding()]
  param (
    [Parameter()][string]$Mystring
    #[Parameter()][Int]$MyInt
  )
  
  begin {

    "Begin $Mystring"
  }
  
  process {

    "Proces $Mystring"
  }
  
  end {
    
    "End $Mystring"
  }
}



#>