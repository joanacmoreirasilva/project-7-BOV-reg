#!/usr/bin/env nextflow

params.seq = 'seq2.fasta'
seq_file = Channel.fromPath(params.seq)

process alignment {

    input:
    file f1 from seq_file

    script:
    """
    /resfinder/run_resfinder.py -acq -ifq $f1
    """
}
