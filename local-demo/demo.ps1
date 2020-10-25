# PowerShell script for demo in group session.

$rgName = 'grp-session-demo'

New-AzResourceGroupDeployment `
  -Name "grpDemo-$(Get-Date -Format 'yyyyMMdd-HHmmss')" `
  -TemplateFile ".\local-demo\stor-single.jsonc" `
  -ResourceGroupName $rgName `
  -acctNamePrefix "azps"
