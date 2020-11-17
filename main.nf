#!/usr/bin/env nextflow

params.file1  = 'file1.fq'
params.file2 = 'file2.fq'
genome = Channel.from(params.file1)
ref_genome = Channel.from(params.file2)

process alignment {

    input:
    file f1 from genome
    file f2 from ref_genome

    output:
    file 'alignment' into seq_alignment

    """
    clustalw -PROFILE1=$f1 and -PROFILE2=$f2 -OUTFILE=alignment
    """
}
