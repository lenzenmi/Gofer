#!/bin/env bash
docker run --rm -it -u $(id -u):$(id -g) -v "/$(pwd)":/documents/ docker.io/asciidoctor/docker-asciidoctor asciidoctor-revealjs -a revealjsdir=reveal.js presentation.adoc