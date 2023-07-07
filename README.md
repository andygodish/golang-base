# Golang Base

This repo is used as a scaffolding for new Golang projects within a Docker container. 

## Docker

Use the dockerfile to build a development environment locally. You can update the version of go you install in your container by updating the version of goland used in the base images of the Dockerfile. 

Once built, simply run `docker run -it -v ${PWD}:/work go sh`. The use of the volume will allow you to use your IDE outside of your running docker container. 

### Build Local Development Container

```
docker build -t goland:dev --target dev .
```

The `--target dev` will only build the dev base defined in your Dockerfile. 

## Go Module

```
go mod init github.com/andygodish/golang-base
```

## Build

From your interactive terminal (running docker container), build you hello world app:


## Godoc

The dockerfile dev target will install the godoc module automatically. Make sure you are exposing port 8000 in your `docker run` command (`-p 8000:8000`)

```
godoc -http :8000
```

## Testify

https://github.com/stretchr/testify

```
go get github.com/stretchr/testify
```

## Benchmarking

func BenchmarkRepeat(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Repeat("a")
	}
}

```
go test -bench=.
```
