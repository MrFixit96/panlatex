# panlatex
A docker container image with Pandoc, Xelatex, and pandoc-url2cite plugin

Using the image described and stored here, you can take markdown and build a pdf using both latex and html inline.

I pass it a URL for the image and the name of the document to parse, then run it with the following:

```
export PANDOC_IMG=docker.pkg.github.com/mrfixit96/panlatex/panlatex-ubuntu:latest
export DOCNAME=MY_MARKDOWN_FILE_WITH_NO_FILE_EXTENSION
```

```shell
#!/bin/bash
if [[ $PANDOC_IMG ]] && [[ $DOCNAME ]];then
  docker run  -v `pwd`:/data -v `pwd`/../../Assets:/Assets -v `pwd`/../../Assets:/assets -e DOCNAME=${DOCNAME} $PANDOC_IMG
fi
```
