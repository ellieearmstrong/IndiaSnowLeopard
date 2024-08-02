#This file contains scripts related to assembly of the base genome (contig assembly) of the CLR Pacbio data from an indian snow leopard

#Assembler 1-Flyev2.9.2
flye --pacbio-raw m64137_200918_181929.fastq.gz --out-dir . --genome-size 2.4g -t 48 --resume

#Assembler 2-Canuv2.0
canu -p SL-uncorr-canu -d SL-canu-uncorr_grid genomeSize=2.4g -pacbio m64137_200918_181929.fastq.gz useGrid=false

#Assembler 3-Redbean (wtdbg2)
wtdbg2 -x sq -g 2.4g -t 48 -i m64137_200918_181929.fastq.gz -fo SL_redbean_v1
wtpoa-cns -t 24 -i SL_redbean_v1.ctg.lay.gz -fo SL_redbean_v1.ctg.raw.fa

#Assembler 4-Nextdenovov-2.5.2-3
nextDenovo run.cfg
