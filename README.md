# README

## Presentation

### Running
Requires reveal.js which is included as a sub repo.

Thus you must clone this repository locally and either pass `--recurse-submodules` to git clone do `git submodule init && git submodule update` after cloning

Open `asciidoctor/presentation.html` in web browser

### Rebuilding
Requires Docker and Windows Bash

```bash
cd asciidoctor
./build.sh
```

## Architecture Design Records

Can be found [here](adrs)

Templates were generated using [ADR Go](https://github.com/marouni/adr)

## System Drawings
### View using Structurizr (Best)
Requires docker and git bash for windows

```bash
  cd structurizr
  ./build.sh
```
Then open a web browser http://localhost:8080

### PNG images (Just in case)
Can be found [here](structurizr/images)

