function Get-CoinbaseProAccounts { 
        
    Param(
    [Parameter()] [string] $AccountID,
    [Parameter(Mandatory=$true)] $APIKey,
    [Parameter(Mandatory=$true)] $APISecret,
    [Parameter(Mandatory=$true)] $APIPhrase,
    [parameter()] [switch] $SandboxAPI
    )
    
    $api = Get-BlankAPI -SandboxAPI:$SandboxAPI
    $api.key = "$APIKey"
    $api.secret = "$APISecret"
    $api.passphrase = "$APIPhrase"

    $api.method = 'GET'
    $api.url = '/accounts'
    If ($AccountID) {$api.url += "/$AccountID"}
    $response = Invoke-CoinbaseProRequest $api
    Write-Output $response

}