#The following scripts were used in order to align the draft and final snow leopard genome to the domestic cat

eval "$(conda shell.bash hook)"
conda activate minimap2

minimap2 -ax asm5 GCA_000181335.5_felCat9.1_X_genomic.fna SL_redbean_S3_pilon2_out_JBAT.reviewJul15.FINAL.fa  >felcat9_snowlepJul15.sam

paftools.js sam2paf felcat9_snowlepJul15.sam > felcat9_snowlepJul15.paf


#Alignments were then visualized using R scripts (see alignment_viz.R)
