Hello-World
===========

Hello World test server.

This application run a web server that listens on port 8080 and serves a single index page with a "Hello World" message.

Requirements
------------

- Python 2.7+
- pip (or you'll have to install the necessary python modules yourself)

Running
-------

##### 1. Install required python modules

```bash
pip install -r requirements.txt
```

##### 2. Launch the server

```bash
python main.py
```

##### 3. Stop the server

```bash
CTRL-C
```

Docker
------

This application includes a `Dockerfile` for automated infrastructure provisioning.

##### 1. Build the Docker image

```bash
docker build -t app_name .
```

##### 2. Run the application with Docker

To run interactively:

```bash
docker run -it --rm -p 80:8080 app_name
```

This is equivalent to running `python main.py` as above. Host port 80 will be mapped to the container's port 8080 (where the app is listening). `--rm` specifies that the container should be deleted when the application exists, keeping your Docker environment from getting too cluttered. Kill the server with `CTRL-C` as above.

##### 3. Map your development directory into the Docker container

For active development, you don't want to have to build a new docker image every time you make a change to the code. Instead, you can map your repository directory into the docker container, so changes you make in the repo are reflected immediately in the container.

To map in the current directory and launch a BASH shell in the container instead of the standard app entry point:

```bash
docker run -it --rm -p 80:8080 --entrypoint="bash" -v `pwd`:/app app_name
```

This will give you an interactive shell in the Docker container where you can run your app, run debuggers, examine log output, any anything else you want. When you exit the bash shell, the container will terminate and will be automatically deleted by Docker, so when you run it the next time, you'll have a pristine environment (with the current state of your repo mapped in, of course).



