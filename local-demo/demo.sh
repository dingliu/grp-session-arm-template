# Azuer CLI script for demo in group session.

# Variable for resource group name.
RGNAME='grp-session-demo'

# A resource group level deployment that creates one single storage account.
# The resource group should exist before running this command.
az deployment group create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --template-file "./local-demo/stor-single.jsonc" \
  --resource-group $RGNAME \
  --parameters acctNamePrefix='azcli'

# A resource group level deployment that creates a storage account and two
# blob containers that depend on it.
az deployment group create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --template-file "./local-demo/stor-dependencies.jsonc" \
  --resource-group $RGNAME \
  --parameters acctNamePrefix='dpddemo'

# A resource group level deployment that creates a storage account and a blob
# container. The SKU of the storage account is decided by the environment.
# The creation of the blob container is decided by the boolean parameter.
az deployment group create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --template-file "./local-demo/stor-conditions.jsonc" \
  --resource-group $RGNAME \
  --parameters \
    acctNamePrefix='cond' \
    environment='prod' \
    extraContainer=true

# A resource group level deployment that creates several storage accounts.
# The number of the deployed resources as well as the resource names are
# decided by the argument provided to `acctCopies` parameter.
#
# Here also demos the usage of `jq` command alone with Azure CLI.
az deployment group create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --template-file "./local-demo/stor-loops.jsonc" \
  --resource-group $RGNAME \
  --parameters \
    acctNamePrefix='cp' \
    environment='dev' \
    acctCopies=3 \
  | jq .properties.outputs.storAcctResourceIDs.value -r

# A subscription level deployment that creates several identical resource groups
# in different geo-locations. It then spawns resource group level child deploy-
# ments targeting those resource groups. It uses linked deployments to create
# this repeatable pattern.
#
# Here a version controlled parameter file is used to supply arguments.
az deployment sub create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --location 'EastUS' \
  --template-file "./local-demo/app-linked.jsonc" \
  --parameters @'./local-demo/app-linked.parameters.jsonc'
