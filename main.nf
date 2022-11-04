ch_reads= channel.fromPath(params.fq,checkIfExits:true)

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
