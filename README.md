## To Run:

* Create virtual enviornment

	```virtualenv venv --python=python3```

* Activate Enviornment

	```source venv/bin/activate```

* Install requirements

	```pip install -r requirements.txt```

* Run:

	```python benchmark.py```


## To run in Docker

Run in cpu:

```docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix athiramd/dockertest:benchmark_cpu1```\
```python benchmark.py cpu 10000```

To build and push to dockerhub(Optional):

```DOCKER_BUILDKIT=1 docker build -t benchmark_cpu1 . -f Dockerfile```\
```docker tag benchmark_cpu1 athiramd/dockertest:benchmark_cpu1```(Replace username with Dockerhub userid)\
```docker push athiramd/dockertest:benchmark_cpu1```

Run in gpu:

```docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --runtime nvidia athiramd/dockertest:benchmark_gpu```\
```python benchmark.py gpu 10000```

To build and push to dockerhub(Optional):

```DOCKER_BUILDKIT=1 docker build -t benchmark_gpu . -f Dockerfile```\
```docker tag benchmark_gpu athiramd/dockertest:benchmark_gpu```(Replace username with Dockerhub userid)\
```docker push athiramd/dockertest:benchmark_gpu```