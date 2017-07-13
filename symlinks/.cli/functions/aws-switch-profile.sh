# Switching between accounts easily
#
# how to use:
# aws-switch-profile staging
#
function aws-switch-profile () {
  export AWS_DEFAULT_PROFILE=$1
  export AWS_PROFILE=$1
}
