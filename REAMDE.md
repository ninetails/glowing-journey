# Jekyll running on Docker

## Usage

By default it will run a `jekyll serve` at root.

```sh
docker build -t <image name> . && docker run --rm -it -v ${PWD}:/home/jekyll/site -p 4000:4000 -u jekyll:jekyll <image name>
```

[Based on this](https://stackoverflow.com/a/63551940)
