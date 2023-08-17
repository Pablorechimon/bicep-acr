// Common Parameters
//*****************************************************************************************************
@description('The Azure region into which the resources should be deployed.')
@allowed([
  'eastus'
])
param location string = 'eastus'

@allowed([ 'set', 'setf', 'jmf', 'jmfe' ])
param bu string = 'jmf'

@allowed([ 'poc', 'dev', 'qa', 'uat', 'prd' ])
param stage string = 'poc'

@maxLength(6)
param role string = 'automa'

@maxLength(2)
param appId string = '01'

@maxLength(6)
param appname string = 'app123'

param tags object = {
  owner: 'JM Family'
  environment: 'POC'
  department: 'IT'
  project: 'POC Project'
  IAC: 'Bicep'
}

@description('The ID of Log Analytics Workspace.')
param workspaceId string ='/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/RG-JMF-POC-2/providers/Microsoft.OperationalInsights/workspaces/workspace-lab-jmf-01'

//*****************************************************************************************************

// Storage Account Parameters
//*****************************************************************************************************
@description('Storage Account type')
@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Premium_LRS'
  'Premium_ZRS'
])
param accountTier string = 'Standard_LRS'

@description('Allow or Deny the storage public access. Default is false')
param allowBlobPublicAccess string = 'false'

@description('The name from Service Endpoint VNET.')
param stgServiceEndpointVnetName string = 'vnet-jmf-poc'

@description('The name from Service Endpoint Subnet.')
param stgServiceEndpointSubnetName string = 'StorageSubnet'

@description('The Storage Account access tier')
param accessTier string = 'Hot'
//*****************************************************************************************************

// Storage Account for Data
//*****************************************************************************************************
module storageAccountModule 'br:vidalabacr.azurecr.io/bicep/patterns/storage-account:v1.0.0' = {
//module storageAccountModule '../../../01-COMPONENTS-and-PATTERNS/bicep-modules/modules/patterns/storage-account/simple-storage.bicep' = {  
  name: 'storageAccountModule2'
  params: {
    bu: bu
    stage: stage
    role: role
    appId: appId
    appname: appname
    location: location
    accountTier: accountTier
    accessTier: accessTier
    allowBlobPublicAccess: allowBlobPublicAccess
    stgServiceEndpointVnetName: stgServiceEndpointVnetName
    stgServiceEndpointSubnetName: stgServiceEndpointSubnetName
    workspaceId: workspaceId
    tags: tags
  }
}
//*****************************************************************************************************
