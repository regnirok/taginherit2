## VARIABLES

## Set the suffix for the Assignment ID.  Will display in the form of "subscriptions/SUBSCRIPTION-ID-HERE/providers/Microsoft.Authorization/policyAssignments/$name"
$Name = "0004"
## Set the Assignment Name shown in the Portal
$Displayname = "POL-CRP-NOTALLOWRESOURCES-P-NCUS01"
## Set the Subscription ID of the Subscription we want to apply this policy assignment to
$SubID = "/subscriptions/7e2de2c9-54ba-4e34-a048-05e8c41766c0"
## Set the Resource Group you want to exclude from policy assignment.  This can be changed to an hashtable of RGs if desired
$NotScopeRG = "/subscriptions/7e2de2c9-54ba-4e34-a048-05e8c41766c0/resourceGroups/RG-CRP-NETSEC_IP-P-NCUS01"

$DefinitionID = "/providers/Microsoft.Authorization/policyDefinitions/6c112d4e-5bc7-47ae-a041-ea2d9dccd749"
$definition = get-azurermpolicydefinition -ID $DefinitionID
$Array = @("Microsoft.Network/publicIPAddresses")
$Param = @{"listOfResourceTypesNotAllowed"=$array}

## SCRIPT

New-AzureRmPolicyAssignment -name $name -displayname $Displayname -scope $SubID -notscope $NotScopeRG -policydefinition $definition -PolicyParameterObject $Param
