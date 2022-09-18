#!/opt/conda/bin/Rscript --save
library(GENESPACE)

old_path <- Sys.getenv("PATH")

Sys.setenv(PATH = paste(old_path, "/opt/conda/bin/", sep = ":"))

system("echo $PATH")

Sys.which("/opt/conda/bin/orthofinder")

runwd <- file.path("/tmp/testGenespace")

make_exampleDataDir(writeDir = runwd)

setwd("/tmp/testGenespace")

gids <- c("human","chimp","rhesus")
gpar <- init_genespace(
  genomeIDs = gids, 
  speciesIDs = gids, 
  versionIDs = gids, 
  ploidy = rep(1,3),
  wd = runwd, 
  gffString = "gff", 
  pepString = "pep",
  path2orthofinder = "orthofinder", 
  path2mcscanx = "/tmp/MCScanX",
  rawGenomeDir = file.path(runwd, "rawGenomes"))

parse_annotations(
  gsParam = gpar, 
  gffEntryType = "gene", 
  gffIdColumn = "locus",
  gffStripText = "locus=", 
  headerEntryIndex = 1,
  headerSep = " ", 
  headerStripText = "locus=")

gpar <- run_orthofinder(gsParam = gpar)

gpar <- synteny(gsParam = gpar)

ripdat <- plot_riparianHits(gpar)

pg <- pangenome(gpar)  