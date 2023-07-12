param storageAccountName string = 'testestgvidal'
param location string = 'eastus'
param accountTier string = 'Standard_LRS'

//module storageAccountModule 'br:vidalabacr.azurecr.io/bicep/patterns/simple-storage:v1' = {
// Using alias in the module path.  
module storageAccountModule 'br/ACR-LAB:bicep/patterns/simple-storage:v1' = {
  name: 'storageAccountModule3'
  params: {
    storageAccountName: storageAccountName
    location: location
    accountTier: accountTier
  }
}

// output storageAccountId string = storageAccountModule.outputs.storageAccountId
//output storageAccountConnectionString string = storageAccountModule.outputs.storageAccountConnectionString
//