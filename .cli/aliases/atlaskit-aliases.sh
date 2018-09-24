# Atlaskit + Jira frontend
alias watch-jira="nodemon --exec 'cp -rf ../atlaskit-mk-2/packages/core/navigation-next/dist ./node_modules/@atlaskit/navigation-next/ && yarn start --ngrok-subdomain=wmendesneto' -w ../atlaskit-mk-2/packages/core/navigation-next/dist --delay 3"
alias watch-jira-fragments="nodemon --exec 'cp -rf ../atlaskit-mk-2/packages/core/navigation-next/dist ./node_modules/@atlaskit/navigation-next/ && yarn start global-single-fragment rapid-board-apps global-fragment-navigation-skeleton-placeholder --ngrok-subdomain=wmendesneto' -w ../atlaskit-mk-2/packages/core/navigation-next/dist --delay 3"
alias watch-jira-global-nav="nodemon --exec 'cp -rf ../atlaskit-mk-2/packages/core/navigation-next/dist ./node_modules/@atlaskit/navigation-next/ && yarn start global-single-fragment global-fragment-navigation-skeleton-placeholder --ngrok-subdomain=wmendesneto' -w ../atlaskit-mk-2/packages/core/navigation-next/dist --delay 3"
alias watch-jira-rapid-board="nodemon --exec 'cp -rf ../atlaskit-mk-2/packages/core/navigation-next/dist ./node_modules/@atlaskit/navigation-next/ && yarn start rapid-board-apps global-fragment-navigation-skeleton-placeholder --ngrok-subdomain=wmendesneto' -w ../atlaskit-mk-2/packages/core/navigation-next/dist --delay 3"
alias wj="watch-jira"
alias wjf="watch-jira-fragments"
alias wjgn="watch-jira-global-nav"
alias wjrb="watch-jira-rapid-board"

alias watch-nav-next="nodemon --exec 'killall ngrok || echo \"NGrok is not running\" && build-atlaskit-package --name=navigation-next --folder=packages/core/navigation-next' -w packages/core/navigation-next/src --delay 3"
alias watch-global-navigation="nodemon --exec 'killall ngrok || echo \"NGrok is not running\" && bolt build:global-navigation' -w packages/core/global-navigation/src --delay 3"
alias wnn="watch-nav-next"
alias wgn="watch-global-navigation"

alias watch-nav-next-storybook="nodemon --exec 'build-atlaskit-package --name=navigation-next --folder=packages/core/navigation-next && cp -rf ../atlaskit-mk-2/packages/core/navigation-next/dist ../jira-frontend/node_modules/@atlaskit/navigation-next/' -w packages/core/navigation-next/src --delay 3"
alias watch-global-navigation-storybook="nodemon --exec 'build-atlaskit-package --name=global-navigation --folder=packages/core/global-navigation && cp -rf packages/core/global-navigation/dist ../jira-frontend/node_modules/@atlaskit/global-navigation/' -w packages/core/global-navigation/src --delay 3"
