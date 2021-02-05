# panlatex
A docker container image with Pandoc, Xelatex, and pandoc-url2cite plugin

Using the image described and stored here, you can take markdown and build a pdf
with citations while using both latex and html inline.

To use the container, run  run `docker-run.sh basename` passing the base name of
the file to parse (ie. myMarkdown instead of myMarkdown.md):

```shell
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
  docker run  -v `pwd`:/data \
              -v `pwd`/../../Assets:/Assets \
              -v `pwd`/../../Assets:/assets \
              -e DOCNAME=${1} $PANDOC_IMG
fi

```
