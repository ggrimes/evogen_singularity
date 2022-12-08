# Example Dockerfile using conda to install packages

To create a Dockerfile that uses conda to install samtools, you can use the following steps:

Start by creating a new file called `Dockerfile` in your working directory.


## Specify the base image

In the `Dockerfile`, specify the base image that you want to use. 

**Note** A Docker base image is a starting point for creating Docker containers. It includes the basic elements and libraries necessary for running a container, such as the operating system and common software packages. Base images are typically created by organizations or individuals and made available for use by the Docker community. They can be customized and built upon to create specific applications or services.

This can be any image that includes the conda package manager, such as the `continuumio/miniconda3` image. 

For example:


`FROM continuumio/miniconda3`


## create a new conda environment

Next, run the conda command to create a new conda environment and install the samtools package. This can be done in a single RUN command, as follows:

`RUN conda create -n samtools-env samtools`

This will create a new conda environment called `samtools-env` and install the samtools package within it.

After the environment is created and the samtools package is installed, you can activate the environment using the `conda activate` command. 

This can be done in a separate RUN command, as follows:

`RUN conda activate samtools-env`

### Add default command

Finally, you can specify the default command that should be run when the Docker container is started. 

This can be the `samtools` command, for example:

`CMD ["samtools"]`

## Final DockeFile

Your complete Dockerfile should look something like this:

~~~
FROM continuumio/miniconda3
RUN conda create -n samtools samtools
RUN conda activate samtools
CMD ["samtools"]
~~~


## Build Docker image

Once you have created the Dockerfile, you can build the Docker image by running the docker build command and specifying the path to the Dockerfile. 

For example:


`$ docker build -t samtools:1.16.1 .`

This will create a new Docker image called `my-samtools-image` 

that includes the samtools package and is ready to use. 


## Run Docker container

You can then run a Docker container using this image by running the docker run command, as follows:


`$ docker run -it my-samtools-image`

This will start a new Docker container based on the my-samtools-image image and run the default samtools command. 

You can then use the samtools command as you normally would within the Docker container.

## Publish to Docker Hub

To publish image to Docker hub

`docker login -u <username> -p <password>`
`docker tag <image name>:<tag> <username>/<image name>:<tag>`
`docker push <username>/<image name>:<tag>`

### Convert to Singularity image

`singularity build <image name>.sif docker://<username>/<image name>:<tag>`



# Alternative steps

You can specify the conda environment in a file and use this to create the environment

In the same working directory as the Dockefile add the copy statement for the environment.yaml file

`COPY environment.yaml /tmp/environment.yaml`

## Install packages from environment.yaml


`RUN conda env create -f /tmp/environment.yaml`

Activate the conda environment

`RUN echo "source activate <environment name>" > ~/.bashrc`
`ENV PATH /opt/conda/envs/<environment name>/bin:$PATH`

## Shrink Docker image

https://pythonspeed.com/articles/conda-docker-image-size/
## Notes on shrink conda image size here

https://pythonspeed.com/articles/conda-docker-image-size/

