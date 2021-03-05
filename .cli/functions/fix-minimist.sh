#
#
# How to use
#
# $ cd <your-project>
# $ fix-minimist <JIRA-TICKET-NUMBER>
#
fix-minimist () {
  sed -i.bak '/^minimist@/,/^$/d' yarn.lock
  yarn
  git add yarn.lock
  git checkout -b fix/$1-bump-minimist
  git add yarn.lock
  git commit -m "fix: $1 bump minimist"
  git push
}
