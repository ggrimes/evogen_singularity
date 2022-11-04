# evogen_singularity

Nextflow singularity example

Demo of using singularity for Evogen talk Nov 2022



~~~
git clone https://github.com/ggrimes/evogen_singularity
module load igmm/bac/nextflow/22.04.0.5697
unset NXF_SINGULARITY_CACHEDIR
nextflow run  evogen_singularity 
~~~

error will appear

add fastqc container to nextflow.config and set singularity to be enabled
~~~

~~~
