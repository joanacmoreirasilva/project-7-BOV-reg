#!/usr/bin/env nextflow

params.file1  = 'ref_genome.fasta'
params.file2 = 'seq2.fasta'
seq1 = Channel.fromPath(params.file1)
seq2 = Channel.fromPath(params.file2)

process alignment {

    input:
    file f1 from seq1
    file f2 from seq2

    output:
    file 'alignment' into seq_alignment

    """
    clustalw -PROFILE1=$f1 -PROFILE2=$f2 -OUTFILE=alignment
    """
}
