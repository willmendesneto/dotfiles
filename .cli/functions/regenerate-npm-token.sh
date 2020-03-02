function regenerate-npm-token() {
  if [[ -n "$1" ]]; then
    echo "Let's clean .npm and .npmrc"
    rm -rf ~/.npm/* ~/.npmrc
    echo "Now I will fetch your new NPM token, when asked for a password"
    echo "follow this instructions https://hello.atlassian.net/wiki/spaces/RELENG/pages/137953491/HOWTO+-+Generate+an+Artifactory+API+Key+for+packages.atlassian.com"
    echo "to get your API key"
    curl -u $1 https://packages.atlassian.com/api/npm/atlassian-npm/auth/atlassian > ~/.npmrc
    echo "https://github.com/willmendesneto/dotfiles/blob/master/.cli/functions/regenerate-npm-token.sh" >> ~/.npmrc
  else
    echo "proper usage: regenerate-npm-token <your-npm-username>:<your-npm-token>."
  fi
}
