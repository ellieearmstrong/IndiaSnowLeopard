#The following scripts were used in order to scaffold the base snow leopard assembly using HiC data. Manual edits were then made using juicebox

module load biology bwa/0.7.17
module load biology samtools/1.16.1

bwa index -a bwtsw redbean_sample3map_pilon2.fasta

bwa mem -t 24 -5SP redbean_sample3map_pilon2.fasta ../../nucleome-denovo1010_S3HiC_R1.fastq-001.gz ../../nucleome-denovo1010_S3HiC_R2.fastq-001.gz | samblaster | samtools view -S -h -b -F 2316 > SL_redbean_sample3map_pilon2.bam

samtools faidx redbean_sample3map_pilon2.fasta

yahs redbean_sample3map_pilon2.fasta SL_redbean_sample3map_pilon2.bam -o SL_redbean_sample3map_pilon2.hic

juicer pre -a -o SL_redbean_S3_pilon2_out_JBAT SL_redbean_sample3map_pilon2.hic.bin SL_redbean_sample3map_pilon2.hic_scaffolds_final.agp redbean_sample3map_pilon2.fasta.fai > SL_redbean_S3_pilon2_out_JBAT.log 2>&1

(java -jar -Xmx32G juicer_tools.1.9.9_jcuda.0.8.jar pre SL_redbean_S3_pilon2_out_JBAT.txt SL_redbean_S3_pilon2_out_JBAT.hic.part <(cat SL_redbean_S3_pilon2_out_JBAT.log  | grep PRE_C_SIZE | awk '{print $2" "$3}')) && (mv SL_redbean_S3_pilon2_out_JBAT.hic.part SL_redbean_S3_pilon2_out_JBAT.hic)
