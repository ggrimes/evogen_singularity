params.fq = "data/ref1_1.fq.gz"

ch_reads= channel.fromPath(params.fq)

process FASTQC {
  input:
  path read
  
  script:
  """
  fastqc $read
  """
}



workflow {
  FASTQC(ch_reads)
}
