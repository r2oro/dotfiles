#!/usr/bin/env bash

source ./lib.sh
###############################################################################
bot "Vagrant Plugins..."
###############################################################################
require_vagrant_plugin vagrant-aws
require_vagrant_plugin vagrant-cachier
require_vagrant_plugin vagrant-berkshelf
require_vagrant_plugin vagrant-env
require_vagrant_plugin vagrant-omnibus
require_vagrant_plugin vagrant-proxyconf
require_vagrant_plugin vagrant-share
require_vagrant_plugin vagrant-triggers

###############################################################################
bot "adding in Atom configuration modules"
###############################################################################
# require_apm linter-eslint
require_apm atom-beautify
require_apm atom-alignment
require_apm bracket-close-jump
require_apm fancy-bracket-matcher
require_apm jsonlint
require_apm language-chef
require_apm language-powershell
require_apm line-ending-converter
require_apm linter
require_apm tree-view-git-status
