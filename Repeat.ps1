#Do Loop Repeat the following code while whats in the parenthis is still true
$i = 1
Do {
  Write-Output "Powershell is Great ! $i"
  $i=$i+1 #$i++ This is how you increment (or add one to variable each time)
} while ($i -le 5)

While ($i -ge 1){
  Write-Output "Scripting is great! $i"
  $i-- # This is how decrement (or subtract on from the variable each time)
}

# Foreach = When you don't know how many items are in list and you want to act on each one
$services = Get-Servce -name b*
ForEach ($s in $services) {
  $s.DisplayName
}


#For Loop = When you want to count a specific number
For ($i=0; $i -lt 5;$i++){
  #do something
}


#Range operator = A way to quickly send number in a specific range
1..5