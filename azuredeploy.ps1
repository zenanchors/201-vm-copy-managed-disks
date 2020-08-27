$RG = New-AzResourceGroup -Name "201-vms" -Location "UK South"
$securepassword = (Get-AzKeyVaultSecret -vaultName "armtrainingkeyvault" -name "armtrainingvaultpassword").SecretValueText
$securepassword = ConvertTo-SecureString $securepassword -AsPlainText -Force
New-AzResourceGroupDeployment -Name "201-vm-multiple" -ResourceGroupName $RG -TemplateFile ".\azuredeploy.json" -TemplateParameterFile ".\azuredeploy.parameters.json" `
-virtualMachineAdminUserName "zenadmin" -virtualMachineAdminPassword $securepassword -virtualMachineNamePrefix "vm" -virtualMachineCount "3" -dnsPrefixForPublicIP "pub"