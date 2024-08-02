#All polishing was completed with the following scripts (example using one polishing round below)
#Two rounds of polishing were tested after the base assembly was complete for both redbean and flye assemblies
#Two rounds of polishing were tested after HiC was complete and the assembly was manually reoriented and ordered using Juicebox

module load biology bwa/0.7.17
module load biology samtools/1.16.1

bwa index -a bwtsw flye_uncorrCLR/assembly.fasta 
bwa mem -t 24 flye_uncorrCLR/assembly.fasta sample3_L1_378378.R1.fastq.gz sample3_L1_378378.R2.fastq.gz | samtools view -bS - | samtools sort > flye_uncorrCLR_sample3map.sorted.bam
samtools index flye_uncorrCLR_sample3map.sorted.bam

source applications/miniconda3/etc/profile.d/conda.sh
conda activate pilon

export _JAVA_OPTIONS="-Xmx160G"
pilon --genome flye_uncorrCLR/assembly.fasta --frags flye_uncorrCLR_sample3map.sorted.bam --output flye_uncorrCLR_sample3map_pilon1 --diploid 
