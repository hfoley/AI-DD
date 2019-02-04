$startTime = Get-Date
$subscriptionID = '<ENTER SUBSCRIPTION ID HERE>'
$resourceGroupName = "AIDDCincy"
$resourceGroupLocation = "East US2" 

Write-Host "The resource group creation script was started " $startTime
Login-AzureRmAccount
Select-AzureRmSubscription -Subscriptionid $subscriptionID


#Create or check for existing resource group
$resourceGroup = Get-AzureRmResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if(!$resourceGroup)
{
    Write-Host "Resource group '$resourceGroupName' does not exist. To create a new resource group, please enter a location.";
    if(!$resourceGroupLocation) {
        $resourceGroupLocation = Read-Host "resourceGroupLocation";
    }
    Write-Host "Creating resource group '$resourceGroupName' in location '$resourceGroupLocation'";
    New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
}

else{
    Write-Host "Using existing resource group '$resourceGroupName'";
}


$endTime = Get-Date
write-host "Ended resource group creation at " $endTime