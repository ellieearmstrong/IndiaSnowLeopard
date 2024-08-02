#The following scripts were used to assess assembly completeness using compleasm and contiguity using scripts from Assemblathon2

#Assemblathon 
perl assemblathon-stats-ex.pl hic-scaffolding/SL_redbean_S3_pilon2_out_JBAT.reviewJul15.FINAL.fa > SL_redbean_S3_pilon2_out_JBAT.reviewJul15-stats.txt


#Compleasm
singularity exec compleasm_v0.2.5.sif compleasm run -a SL_redbean_S3_pilon2_out_JBAT.reviewJul15.pilon2.fasta -o SL_redbean_S3_pilon2_out_JBAT.reviewJul15.pilon2_compleasm_carnivora -l carnivora_odb10 -t 24
