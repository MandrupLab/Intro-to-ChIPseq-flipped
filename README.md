## Introduction to ChIP-seq (2-part series)


| Audience | Computational Skills | Prerequisites | Duration |
:----------|:----------|:----------|:----------|
| Biologists | Intermediate | None | Shell basics and/or Introduction to R |


### Learning Objectives

1.	Understand the necessity for, and use of, the command line interface (bash) and HPC for analyzing high-throughput sequencing data.
2.	Understand best practices for designing a ChIP-seq experiment and analysis the resulting data.

> These materials were developed for a trainer-led workshop, but are also amenable to self-guided learning.

### Description

This repository has teaching materials for an Introduction to ChIP-sequencing data analysis workshop. The workshop is organized into two parts:

### Part I: Raw reads to peak calls (4 sessions)
> Pre-requisite: Introduction to Shell

This workshop focuses on teaching computational skills to enable the effective use of an high-performance computing environment to implement a ChIP-seq data analysis workflow. In addition to running the workflow from FASTQ files to peak calls, the workshop covers best practice guidelines for ChIP-seq experimental design and data organization/management and data visualization for quality control.

* Introduction to ChIP-seq
* QC using FASTQC
* Alignment theory and considerations for ChIP-seq
* Alignment and filtering of reads
* Peak calling
* Peak visualization (using deepTools)
  
### Part II: Peak annotation and differential enrichment analysis
> Pre-requisite: Introduction to R

This workshop focuses on using the R statistical programming environment to evaluate files generated from peak calling of ChIP-seq data. We describe the different file formats encountered with ChIP-seq and use various Bioconductor packages to look at concordance between replicates and annotate regions using nearest gene approaches. We demonstrate the use of DiffBind to evaluate changes in binding patterns between groups of samples, and explore genomic regions of interest as tracks in the Integrated Genome Viewer (IGV).

* File formats for ChIP-seq
* Peak concordance between replicates
* ChIPQC?
* Peak annotation and visualization
* Differential enrichment analysis
* Peak visualization using a genome viewer (IGV)


### Lessons
**[Click here](schedule/README.md) for links to lessons and the suggested schedule**

### Dataset

### Installation Requirements

Download the most recent versions of R and RStudio for your laptop:

 - [R](http://lib.stat.cmu.edu/R/CRAN/) (version 3.5.0 or above)
 - [RStudio](https://www.rstudio.com/products/rstudio/download/#download)
 
> **NOTE**: When installing the following packages, if you are asked to select (a/s/n) or (y/n), please select “a” or "y" as applicable.

(1) Install the below packages on your laptop from CRAN. You DO NOT have to go to the CRAN webpage; you can use the following function to install them:


```r
install.packages("BiocManager")
install.packages("tidyverse")
```

**Note that these package names are case sensitive!**


(2) Install the below packages from Bioconductor. Load BiocManager, then run BiocManager's `install()` function 7 times for the 7 packages:

```r
library(BiocManager)
install("insert_first_package_name_in_quotations")
install("insert_second_package_name_in_quotations")
& so on ...
```

Note that these package names are case sensitive!

```r
ChIPQC
ChIPseeker
DiffBind
clusterProfiler
AnnotationDbi
TxDb.Hsapiens.UCSC.hg19.knownGene
EnsDb.Hsapiens.v75
org.Hs.eg.db
```

> **NOTE:** The library used for the annotations associated with genes (here we are using `TxDb.Hsapiens.UCSC.hg19.knownGene` and `EnsDb.Hsapiens.v75`) will change based on organism (e.g. if studying mouse, would need to install and load `TxDb.Mmusculus.UCSC.mm10.knownGene`). The list of different organism packages are given [here](https://github.com/hbctraining/Training-modules/raw/master/DGE-functional-analysis/img/available_annotations.png).

(3) Finally, please check that all the packages were installed successfully by **loading them one at a time** using the `library()` function.  

```r
library(tidyverse)
library(ChIPQC)
library(ChIPseeker)
library(DiffBind)
library(clusterProfiler)
library(AnnotationDbi)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(EnsDb.Hsapiens.v75)
```

(4) Once all packages have been loaded, run sessionInfo().  

```r
sessionInfo()
```

***
*These materials have been developed by members of the teaching team at the [Harvard Chan Bioinformatics Core (HBC)](http://bioinformatics.sph.harvard.edu/). These are open access materials distributed under the terms of the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*

* *Some materials used in these lessons were derived from work that is Copyright © Data Carpentry (http://datacarpentry.org/). 
All Data Carpentry instructional material is made available under the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0).*

