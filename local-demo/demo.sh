# Azuer CLI script for demo in group session.

RGNAME='grp-session-demo'

az deployment group create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --template-file "./local-demo/stor-single.jsonc" \
  --resource-group $RGNAME \
  --parameters acctNamePrefix='azcli'

az deployment group create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --template-file "./local-demo/stor-dependencies.jsonc" \
  --resource-group $RGNAME \
  --parameters acctNamePrefix='dpddemo'

az deployment group create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --template-file "./local-demo/stor-conditions.jsonc" \
  --resource-group $RGNAME \
  --parameters \
    acctNamePrefix='cond' \
    environment='prod' \
    extraContainer=true

az deployment group create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --template-file "./local-demo/stor-loops.jsonc" \
  --resource-group $RGNAME \
  --parameters \
    acctNamePrefix='cp' \
    environment='dev' \
    acctCopies=3 \
  | jq .properties.outputs.storAcctResourceIDs.value -r

az deployment sub create \
  --name "grpDemo-$(date +'%Y%m%d-%H%M%S')" \
  --location 'EastUS' \
  --template-file "./local-demo/app-linked.jsonc" \
  --parameters @'./local-demo/app-linked.parameters.jsonc'
