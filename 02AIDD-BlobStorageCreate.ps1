$startTime = Get-Date
$subscriptionID = '<ENTER SUBSCRIPTION ID HERE>'
$resourceGroupName = "AIDiscoveryDay"
$resourceGroupLocation = "East US2" 
$storageAccountName = "aiddstorage"
$containerName1 = "beerme"
#$containerName2 = "othername"
#$containerName3 = "othername2"


Write-Host "The blob storage creation script was started " $startTime

Login-AzureRmAccount

Select-AzureRmSubscription -Subscriptionid $subscriptionID

$storageAccount = New-AzureRmStorageAccount -ResourceGroupName $resourceGroupName `
  -Name $storageAccountName `
  -Location $resourceGroupLocation `
  -SkuName Standard_LRS `
  -Kind Storage

$ctx = $storageAccount.Context


New-AzureStorageContainer -Name $containerName1 -Context $ctx -Permission blob
#New-AzureStorageContainer -Name $containerName2 -Context $ctx -Permission blob
#New-AzureStorageContainer -Name $containerName3 -Context $ctx -Permission blob


$endTime = Get-Date
write-host "Ended blob storage creation at " $endTime
