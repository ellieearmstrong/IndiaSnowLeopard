library(ggplot2)
library(dplyr)
library(tidyverse)
library(pafr)

sl_cat <- read_paf('felcat9_snowlepJul15.paf')

dotplot(sl_cat, label_seqs=TRUE)
