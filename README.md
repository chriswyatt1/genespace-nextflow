# genespace-nextflow
Nextflow wrapper for genespace

Step 1: Go to the repository to check it out : https://github.com/chriswyatt1/genespace-nextflow

Step 2: click this link: `https://gitpod.io/#https://github.com/chriswyatt1/genespace-nextflow`, to enter a gitpod environment (login using your Github credentials).

To run the example dataset in gitpod, use:

` ./nextflow run main.nf -profile docker`

Step 3: To run your own data:


## Important

I had to manually install orthofinder into the bin directory, as the docker container could not find the executable when running Nextflow, despite it finding it when running the container interactively. This need to be fixed.


# To test the Docker container:

`docker run -it chriswyatt/genespaces bash`