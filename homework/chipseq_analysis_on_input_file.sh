#!/bin/bash/

# This script takes a fastq file of ChIP-seq data, runs FastQC and outputs a BAM file for it that is ready for peak calling. Fastq files are aligned against the mm10 genome using Bowtie2. The outputted BAM file **does not** contain duplicate reads and is sorted by genomic coordinates using sambamba and samtools, respectively.
# USAGE: sh chipseq_analysis_on_input_file.sh <path to the fastq file>

# initialize a variable with an intuitive name to store the name of the input fastq file
fq=$1

# grab base of filename for naming outputs
base=`basename $fq .fastq.gz`  

# directory with bowtie genome index
genome=/n/groups/shared_databases/bowtie2_indexes/mm10

# make all of the output directories
# The -p option means mkdir will create the whole path if it 
# does not exist and refrain from complaining if it does exist
mkdir -p ~/chipseq_workshop/results/fastqc
mkdir -p ~/chipseq_workshop/results/bowtie2

# set up output filenames and locations
fastqc_out=~/chipseq_workshop/results/fastqc
bowtie_results=~/chipseq_workshop/results/bowtie2

## set up file names
align_sam=~/chipseq_workshop/results/bowtie2/${base}.sam
align_bam=~/chipseq_workshop/results/bowtie2/${base}.bam
align_sorted=~/chipseq_workshop/results/bowtie2/${base}_sorted.bam
align_final=~/chipseq_workshop/results/bowtie2/${base}_final.bam

# set up the software environment
module load fastqc/0.11.3
module load gcc/6.2.0  
module load bowtie2/2.2.9
module load samtools/1.9
module load sambamba/0.7.1

echo "FastQC analysis of $base"

# Run FastQC and place the output to the appropriate folder
fastqc -o $fastqc_out $fq

echo "Bowtie2 alignment of $base"

# Run bowtie2
bowtie2 -p 2 -q --local -x $genome -U $fq -S $align_sam

echo "Convert SAM to BAM for $base"

# Create BAM from SAM
samtools view -h -S -b -o $align_bam $align_sam

# Remove SAM file
rm $align_sam

echo "Filtering $base BAM file"

# Sort BAM file by genomic coordinates
samtools sort $align_bam -o $align_sorted 

# Filter out duplicates
sambamba view -h -t 2 -f bam -F "[XS] == null and not unmapped " $align_sorted > $align_final

# Create indices for all the bam files for visualization and QC
samtools index $align_final

echo "The analysis for $base is done!"
