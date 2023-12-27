#!/bin/bash

GITPATH="$(dirname "$(realpath "$0")")"
ln -svf ${GITPATH}/.bashrc ${USER_HOME}/.bashrc
ln -svf ${GITPATH}/.vimrc ${USER_HOME}/.vimrc
ln -svf ${GITPATH}/inputrc /etc/inputrc