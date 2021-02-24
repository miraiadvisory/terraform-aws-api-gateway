## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_api_gateway_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) |
| [aws_api_gateway_integration_response](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration_response) |
| [aws_api_gateway_method](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) |
| [aws_api_gateway_method_response](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_response) |
| [aws_api_gateway_resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) |
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_lambda_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| execution\_arn | n/a | `string` | n/a | yes |
| function\_name | n/a | `string` | n/a | yes |
| invoke\_arn | n/a | `string` | n/a | yes |
| path\_part | n/a | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| request\_parameters | n/a | `map` | n/a | yes |
| request\_parameters\_validator\_id | n/a | `string` | n/a | yes |
| rest\_api\_id | n/a | `string` | n/a | yes |
| rest\_api\_root\_id | n/a | `string` | n/a | yes |
| uri\_path | n/a | `string` | n/a | yes |

## Outputs

No output.
