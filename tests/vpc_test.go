package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestVpc(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../example/",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	vpcID := terraform.Output(t, terraformOptions, "vpc_id")

	awsRegion := aws.GetRandomStableRegion(t, nil, nil)

	vpc := aws.GetVpcById(t, vpcID, awsRegion)

	assert.Equal(t, "10.0.0.0/16", vpc.CidrBlock)
	assert.Equal(t, 1, len(vpc.Subnets))
	assert.Equal(t, "us-east-1a", vpc.Subnets[0].AvailabilityZone)
}
