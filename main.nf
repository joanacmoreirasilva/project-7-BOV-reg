#!/usr/bin/env nextflow

params.seq = 'seq2.fasta'
seq_file = Channel.fromPath(params.seq)

process alignment {

    input:
    file f1 from seq_file

    script:
    """
    python3 resfinder/run_resfinder.py -ifq $f1
    """
}
