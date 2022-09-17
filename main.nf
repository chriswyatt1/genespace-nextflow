/*
 * Copyright (c) 2022
 */

 /*
 * Authors:
 * - Chris Wyatt <>
 */

/*
 * Default pipeline parameters (on test data). They can be overriden on the command line eg.
 * given `params.name` specify on the run command line `--name My_run_v1`.
 */
 
params.outdir = "Results"
//Path to a folder with the genomes in a specific structure
params.input = "data/Example.csv"


log.info """\
 ===================================
 input file                           : ${params.input}
 output directory                     : ${params.outdir}
 """

//================================================================================
// Include modules
//================================================================================

include { GENESPACE } from './modules/genespace.nf'


//Channel
//    .fromPath(params.input)
//    .splitCsv()
//    .set { in_file }



workflow {

     GENESPACE ( )
    
}

workflow.onComplete {
    println ( workflow.success ? "\nDone! Check results in $params.outdir/ \n" : "Hmmm .. something went wrong\n" )
}

