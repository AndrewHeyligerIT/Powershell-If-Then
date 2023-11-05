## Load in the CSV file and edit the row names so they match what is in  AD
Import-Csv -Path "c:\Data\Employees.csv" -Delimiter "," | Select-Object -Property `
@{Name="EmployeeID";Expression={$_.EmployeeID}},
@{Name="GivenName";Expression={$_.FirstName}},
@{Name="SurName";Expression={$_.LastName}}, `
@{Name="Department";Expression={$_.Department}}, `
@{Name="physicalDeliveryOfficeName";Expression={$_.office}}

## Create a hash table that maps the field in the CSV file to the fields in AD
$SyncFieldMap=@{
    EmployeeID="EmployeeID"
    FirstName="GivenName"
    LastName="SurName"
    Title="Title"
    Department="Department"
    Office="physicalDeliveryOfficeName"

}


## Enumerate over the hash table
$SyncProperties =$SyncFieldMap.GetEnumerator()

## Create an array the stores hash tables
$Properties=ForEach($Property in $SyncProperties){
    @{Name=$Property.Value;Expression=[scriptblock]::Create("`$_.$($Property.key)")}
}