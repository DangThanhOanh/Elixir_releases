#!/usr/bin/env bash
# exit on error
set -o errexit


# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Compile assets
MIX_ENV=prod mix assets.deploy
#npm run deploy --prefix assets && MIX_ENV=prod mix do phx.digest, distillery.release --env=prod
# npm install --prefix ./assets
# npm run deploy --prefix ./assets
# mix phx.digest

# Build the release and overwrite the existing release directory
rm -rf "_build"
MIX_ENV=prod mix release --overwrite
#MIX_ENV=prod mix phx.gen.release --overwrite
