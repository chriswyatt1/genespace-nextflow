library(GENESPACE)
runwd <- file.path("/tmp/testGenespace")
make_exampleDataDir(writeDir = runwd)

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