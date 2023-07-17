# Automatically find the root terragrunt.hcl and inherit its
# configuration
include {
  path = find_in_parent_folders()
}

inputs = {
  namespace = path_relative_to_include()
  content   = "Hello, world!"
}