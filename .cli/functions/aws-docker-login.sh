# AWS ECR Docker login by environment profile 
#
# how to use:
# aws-docker-login staging
#
function aws-docker-login () {
  export AWS_DEFAULT_PROFILE=$1
  export AWS_PROFILE=$1
  AWS_ECR_GET_LOGIN="$(aws ecr get-login)" 
  eval "$(echo "$AWS_ECR_GET_LOGIN" | sed -e 's/ -e none//g')"
}
