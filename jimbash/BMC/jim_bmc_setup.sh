#!/bin/bash

# GITPATH="$(dirname "$(realpath "$0")")"
ln -svf ${PWD}/.bashrc ${HOME}/.bashrc
ln -svf ${PWD}/.vimrc ${HOME}/.vimrc
ln -svf ${PWD}/inputrc /etc/inputrc