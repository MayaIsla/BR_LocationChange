$Body = @{
    tenant = ""
    username = ""
    password = ""
    role = ""
}

$authCode = Invoke-RestMethod -Method 'POST' -Uri "https://saasit.com/api/rest/authentication/login" -Body $Body


$headers = @{
    Authorization=$authCode
    Content='application/json'
}

$taskSavedSearch = Invoke-RestMethod -Method 'GET' -Uri 'https://saasit.com/api/odata/businessobject/Locations'-Headers $headers

$JSONResponse = (ConvertTo-Json $taskSavedSearch) | Out-File "C:\Users\misl7603\Desktop\Scripts\onboardTasks.json"
$value = $JSONResponse | ConvertFrom-Json

$locationName = $value.value.BR_Name
$recID = $value.value.RecId
$digits = $locationName -split '-'
$firstDigit = $digits[0]

$numCharDigit = $firstDigit | measure-object -character | Select-Object -expandproperty characters



#ForEach-Object {
#if ($numCharDigit -lt 4)
#{
#    '0' + $digits
#}
#else {
#   ""
#}
#}