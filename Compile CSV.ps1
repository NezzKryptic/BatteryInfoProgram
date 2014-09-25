#The location the already written XML files
$infoOutputLocation = ".\Raw\"

#Where you'd like your compiled CSV to be written to
$csvOutputLocation = ".\CSVOutput\"
$csvOutputFileName = $csvOutputLocation + "Compiled-BatteryInfo.csv"

#Variable to hold the newline character for file writting
$newLine = [System.Environment]::NewLine

#Create an array in which contains all XML files
$xmlFiles = Get-ChildItem -Path $infoOutputLocation

#ForEach to cycle through all xml files
foreach ($xmlItem in $xmlFiles)
{
    #Get Computer Name
    $computerName = $xmlItem.Name -replace "Battery-","" -replace ".xml",""

    $currentContent = Get-Content $xmlItem.FullName

    $batteryInfoContent = @("","")

    $batteryInfoContent[0] = $currentContent[67] -replace "<value>","" -replace "</value>",""
    $batteryInfoContent[1] = $currentContent[68] -replace "<value>","" -replace "</value>",""

    if (Test-Path $csvOutputLocation)
    {
        [System.IO.File]::AppendAllText($csvOutputFileName, $computerName + "," + $batteryInfoContent[0] + "," + $batteryInfoContent[1] + $newLine)
    }
    else
    {
        mkdir $csvOutputLocation

        [System.IO.File]::AppendAllText($csvOutputFileName, "Computer Name" + "," + "Battery Wear Level<Value 1>" + "," + "Battery Wear Level<Value 2>" + $newLine)

        [System.IO.File]::AppendAllText($csvOutputFileName, $computerName + "," + $batteryInfoContent[0] + "," + $batteryInfoContent[1] + $newLine)
    }

}
