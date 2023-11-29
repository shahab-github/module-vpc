resource "tfe_project" "test" {
  organization = tfe_organization.test-organization.name
  name = "projectname"
}
