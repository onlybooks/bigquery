BigQueryIO.writeTableRows() \
              .to("project-id:dataset-id.table-id") \
              .withCreateDisposition( \
                BigQueryIO.Write.CreateDisposition.CREATE_IF_NEEDED) \
              .withMethod(Method.FILE_LOADS) \
              .withTriggeringFrequency(Duration.standardSeconds(600)) \
              .withNumFileShards(10) \
              .withSchema(new TableSchema()...) \
              .withoutValidation())