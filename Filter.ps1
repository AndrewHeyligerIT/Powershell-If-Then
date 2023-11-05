
# Filter an object and it properties from a list of objects
## Remember its where- "OBJECT"
Get-TimeZone -ListAvailable | Where-Object standardname -like "*eastern*"

# If you want to select a specific value from the object
Get-TimeZone -ListAvailable | Where-Object standardname -like "*eastern*" | Select-Object -Property ID