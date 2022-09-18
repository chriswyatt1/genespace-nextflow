process GENESPACE {
    label 'genespace'
    //tag "$sample_id"
    publishDir "$params.outdir/Genespace_results" , mode: "copy"
    container = 'chriswyatt/genespaces'
             
    //input:

    //    tuple val(sample_id), path(fasta), path(gff)

    output:
        
        path( "./testGenespace/results/*" )

    script:
    """
    genespace.R
    """
}

