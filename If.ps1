
# If this evalutes a state and if it correct executes the following command
If ($this -eq $that){
  #commands
}elseif ($those -ne $them){
  #commands
}elseif ($we -ne $they){
  #commands
}else{
  #commands
}

$status=(Get-Service -name BITS).Status
If ($status -eq "Running"){
  Clear-Host
  Write-Output "Service is being stopped"
}


# Switch this is an alternative to using multiple else ifs
$status = 3
Switch ($status) {
  0 {$status_text = 'ok'}
  1 {$status_text = 'error'}
  2 {$status_text = 'jammed'}
  3 {$status_text = 'overheated'}
  4 {$status_text = 'empty'}
  default { $status_text = 'unknown'}

}

$status_text