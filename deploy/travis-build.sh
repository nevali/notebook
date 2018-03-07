#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
	echo "Skipping deploy; just doing a build." >&2
	make
	exit 0
fi

# Save some useful information
export SHA=`git rev-parse --verify HEAD`

# Get the deploy key by using Travis's stored variables to decrypt deploy_key.enc
ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in deploy/deploy_key.enc -out deploy/deploy_key -d
chmod 600 deploy/deploy_key
eval `ssh-agent -s`
ssh-add deploy/deploy_key

make

# Now that we're all set up, we can push.
git push $SSH_REPO $TARGET_BRANCH