alias watch-jira-nav-next="nodemon --exec 'cp -rf ../atlaskit-mk-2/packages/core/navigation-next/dist ./node_modules/@atlaskit/navigation-next/ && yarn start global-single-fragment global-fragment-navigation-skeleton-placeholder --ngrok-subdomain=wmendesneto --partial-ngrok' -w ../atlaskit-mk-2/packages/core/navigation-next/dist --delay 2"
alias wjnn="watch-jira-nav-next"

alias watch-jira-nav-next-software="nodemon --exec 'cp -rf ../atlaskit-mk-2/packages/core/navigation-next/dist ./node_modules/@atlaskit/navigation-next/ && yarn start software jira-spa global-single-fragment global-fragment-navigation-skeleton-placeholder --ngrok-subdomain=wmendesneto' -w ../atlaskit-mk-2/packages/core/navigation-next/dist --delay 2"
alias wjnns="watch-jira-nav-next-software"

alias watch-nav-next="nodemon --exec 'killall ngrok || echo \"NGrok is not running\" && NODE_ENV=production BABEL_ENV=production:esm bolt workspaces exec --parallel --only-fs 'packages/core/navigation-next' -- babel src -d dist/esm --root-mode upward && NODE_ENV=production BABEL_ENV=production:cjs bolt workspaces exec --parallel --only-fs 'packages/core/navigation-next' -- babel src -d dist/cjs --root-mode upward && npm run build:navigation-next' -w packages/core/navigation-next/src --delay 2"
alias wnn="watch-nav-next"

alias watch-jira-global-nav="nodemon --exec 'cp -rf ../atlaskit-mk-2/packages/core/global-navigation/dist ./node_modules/@atlaskit/global-navigation/ && yarn start global-single-fragment global-fragment-navigation-skeleton-placeholder --ngrok-subdomain=wmendesneto --partial-ngrok' -w ../atlaskit-mk-2/packages/core/global-navigation/dist --delay 2"
alias wjnn="watch-jira-global-nav"

alias watch-global-nav="nodemon --exec 'killall ngrok || echo \"NGrok is not running\" && NODE_ENV=production BABEL_ENV=production:esm bolt workspaces exec --parallel --only-fs 'packages/core/global-navigation' -- babel src -d dist/esm --root-mode upward && NODE_ENV=production BABEL_ENV=production:cjs bolt workspaces exec --parallel --only-fs 'packages/core/global-navigation' -- babel src -d dist/cjs --root-mode upward' -w packages/core/global-navigation/src --delay 2"
alias wgn="watch-global-nav"

alias watch-jira-nav-next-fragments="nodemon --exec 'cp -rf ../atlaskit-mk-2/packages/core/navigation-next/dist ./node_modules/@atlaskit/navigation-next/ && yarn start --ngrok-subdomain=wmendesneto --partial-ngrok' -w ../atlaskit-mk-2/packages/core/navigation-next/dist --delay 2"
alias wjnnf="watch-jira-nav-next-fragments"
