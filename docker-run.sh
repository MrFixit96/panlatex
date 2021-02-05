#!/bin/bash

###################################################################################
#
# File: docker-run.sh
# Date: 2/5/2021
# Author: Micheal Ethridge <methridge@hashicorp.com>
#
##################################################################################

readonly DEFAULT_IMG=docker.pkg.github.com/mrfixit96/panlatex/panlatex-ubuntu:latest

if [[ -z ${PANDOC_IMG} ]]; then
  PANDOC_IMG=${DEFAULT_IMG}
fi
if [[ -z ${1} ]]; then
  echo "No document basename provided."
fi
if [[ ${PANDOC_IMG} ]] && [[ ${1} ]];then
  docker run  -v `pwd`:/data -v `pwd`/../../Assets:/Assets -v `pwd`/../../Assets:/assets -e DOCNAME=${1} $PANDOC_IMG
fi
