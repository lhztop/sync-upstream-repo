#!/usr/bin/env bash

set -x

UPSTREAM_REPO=$1
UPSTREAM_BRANCH=$2
GITHUB_TOKEN=$3

if [[ -z "$UPSTREAM_REPO" ]]; then
  echo "Missing \$UPSTREAM_REPO"
  exit 1
fi

if [[ -z "$DOWNSTREAM_BRANCH" ]]; then
  echo "Missing \$DOWNSTREAM_BRANCH"
  echo "Default to ${UPSTREAM_BRANCH}"
  DOWNSTREAM_BREANCH=UPSTREAM_BRANCH
fi

echo "UPSTREAM_REPO=$UPSTREAM_REPO"

declare -a array=($UPSTREAM_REPO)

for repo in "${array[@]}"
do
  echo $repo
  curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/$repo/merge-upstream \
  -d '{"branch":"main"}'
done


