$login = 'put_your_login_here'
$password = 'put_your_password_here'

$server = 'dev.realpad.eu'
$api_version = 'v10'                                                  
$postparams = @{login=$login;password=$password}

$endpoints = @("list-excel-customers", "list-excel-projects", "list-excel-products", "list-excel-business-cases", "list-excel-events", "list-excel-payments-incoming")

foreach ($endpoint in $endpoints) {
    $filename = "$endpoint $(get-date -f yyyy-MM-dd-HH-mm).xls" 
    Invoke-RestMethod -Uri "https://$server/ws/$api_version/$endpoint" -TimeoutSec 60 -Method POST -Body $postparams -OutFile $filename
}
