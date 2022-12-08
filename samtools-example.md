To create a Dockerfile that uses conda to install samtools, you can use the following steps:

Start by creating a new file called `Dockerfile` in your working directory.


## specify the base image

In the `Dockerfile`, specify the base image that you want to use. 

This can be any image that includes the conda package manager, such as the `continuumio/miniconda3` image. 

For example:


`FROM continuumio/miniconda3`


## create a new conda environment

Next, run the conda command to create a new conda environment and install the samtools package. This can be done in a single RUN command, as follows:

`RUN conda create -n samtools samtools`

This will create a new conda environment called `samtools` and install the samtools package within it.

After the environment is created and the samtools package is installed, you can activate the environment using the conda activate command. 

This can be done in a separate RUN command, as follows:

`RUN conda activate samtools`

Finally, you can specify the default command that should be run when the Docker container is started. T

his can be the samtools command, for example:

`CMD ["samtools --version"]`

## Final DockeFile

Your complete Dockerfile should look something like this:

~~~
FROM continuumio/miniconda3
RUN conda create -n samtools samtools
RUN conda activate samtools
CMD ["samtools --version"]
~~~

Once you have created the Dockerfile, you can build the Docker image by running the docker build command and specifying the path to the Dockerfile. 

For example:


`$ docker build -t my-samtools-image `

This will create a new Docker image called `my-samtools-image` 

that includes the samtools package and is ready to use. You can then run a Docker container using this image by running the docker run command, as follows:


`$ docker run -it my-samtools-image`

This will start a new Docker container based on the my-samtools-image image and run the default samtools command. 

You can then use the samtools command as you normally would within the Docker container.



## Publish to Docker Hub

RUN 

`docker login -u <username> -p <password>`
`docker tag <image name>:<tag> <username>/<image name>:<tag>`
`docker push <username>/<image name>:<tag>`

### Convert to Singularity image

`singularity build <image name>.sif docker://<username>/<image name>:<tag>`
