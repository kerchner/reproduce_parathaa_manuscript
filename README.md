## Instructions

### Clone with submodules

Because `manuscript_parathaa` and `parathaa` are meant to contain the contents of those respective git repositories, it is necessary to
`git clone` using the `--recursive` option:

`git clone --recursive https://github.com/kerchner/reproduce_parathaa_manuscript`

### Set up environment

Because some libraries are only available for linux, we use a Docker container to create an isolated Linux environment.  This project requires
both R and Python libraries, so we use Pixi as a convenient envirnoment manager.

Build and instantiate a Docker container based on `Dockerfile` and `docker-compose.yml`:

`docker compose up -d`

Shell into the container:

`docker exec -it ubuntu24-dev /bin/bash`

Enter a shell in which the Pixi environment is activated:

`pixi shell`

Move into the manuscript code folder.  `parathaa` is installed in a parallel folder.

`cd manuscript_parathaa`

Run the manuscript code as per authors' intstructions:

`python run.py --paraDir ../parathaa/ -o output`
