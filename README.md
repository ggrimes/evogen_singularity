# Evogen_singularity

Resources for Evogen talk 9 Nov 2022


## Nextflow singularity example

Demo of using singularity for Evogen talk Nov 2022



~~~
#clone repo
git clone https://github.com/ggrimes/evogen_singularity

#load nextflow
module load igmm/bac/nextflow/22.04.0.5697

#unset NXF_SINGULARITY_CACHEDIR
unset NXF_SINGULARITY_CACHEDIR

#run nextflow
nextflow run  evogen_singularity 
~~~

error will appear

add fastqc container to nextflow.config and set singularity to be enabled
~~~
vi evogen_singularity /nextflow.config
cat evogen_singularity /nextflow.config
~~~

~~~
process {

 container="https://depot.galaxyproject.org/singularity/fastqc:0.11.9--0"

}

singularity {

	enabled = "true"

}
~~~

## Useful Links

Some links to singularity training, registries etc ... 

### Carpentries

https://carpentries-incubator.github.io/singularity-introduction


## Running Singularity on Eddie

https://www.wiki.ed.ac.uk/pages/viewpage.action?spaceKey=ResearchServices&title=Singularity​

https://www.wiki.ed.ac.uk/pages/viewpage.action?spaceKey=ResearchServices&title=Bioinformatics​

#### Container Registries

Biocontainers

https://biocontainers-edu.readthedocs.io/en/latest/what_is_biocontainers.html

https://pubmed.ncbi.nlm.nih.gov/28379341

#### galaxy depot

https://depot.galaxyproject.org/singularity

https://epcced.github.io/2022-06-21_singularity_edi-wg

### Tutorials

https://biocorecrg.github.io/ELIXIR_containers_nextflow/singularity.html

https://researchcomputing.princeton.edu/support/knowledge-base/singularity

https://csc-training.github.io/csc-env-eff/hands-on/singularity/singularity-tutorial_part2.html

https://www.rc.ucl.ac.uk/docs/Software_Guides/Singularity

https://biocorecrg.github.io/CoursesCRG_Containers_Nextflow_May_2022/singularity.htm

https://www.freecodecamp.org/news/demystifying-containers-101-a-deep-dive-into-container-technology-for-beginners-d7b60d8511c1

## Nextflow

https://www.nextflow.io/docs/latest/singularity.html


