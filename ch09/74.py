_ = (
    examples
    | 'get_tfrecords' >> beam.Map(lambda x: x['tfrecord'])
    | 'writetfr' >> beam.io.tfrecordio.WriteToTFRecord(
    os.path.join(options['outdir'], 'tfrecord', step)))