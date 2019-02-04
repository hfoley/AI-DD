$startTime = Get-Date
$subscriptionID = '<ENTER SUBSCRIPTION ID HERE>'
$resourceGroupName = "AIDDCincy"
$resourceGroupLocation = "East US2" 
$storageAccountName = "aiddcincy"
$containerName = "beerme"



Write-Host "The blob storage and container create script was started at " $startTime
Login-AzureRmAccount
Select-AzureRmSubscription -Subscriptionid $subscriptionID

$storageAccount = New-AzureRmStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $resourceGroupLocation -SkuName Standard_LRS -Kind Storage
$ctx = $storageAccount.Context
New-AzureStorageContainer -Name $containerName -Context $ctx -Permission blob

$endTime = Get-Date
write-host "Ended resource group creation at " $endTime