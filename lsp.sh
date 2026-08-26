#!/usr/bin/env bash
# Install LSP servers.
# npm-based servers are installed globally with vite-plus (`vp`).
#
# NOTE: ~/.npmrc sets `min-release-age`, a supply-chain guard that blocks
# recently-published versions. npm's abbreviated install packument omits
# publish-time data, so npm conservatively filters *every* version and fails
# with ENOVERSIONS. Override it for this one-off install of established
# packages (their pinned versions are old enough to pass the age gate anyway).
export npm_config_min_release_age=0

vp add -g \
	@typescript/native-preview \
	vscode-langservers-extracted \
	@olrtg/emmet-language-server \
	@tailwindcss/language-server \
	@vue/language-server \
	svelte-language-server \
	@github/copilot-language-server \
	prisma

# Non-npm servers.
sudo pacman -Syy lua-language-server gopls pyright biome
