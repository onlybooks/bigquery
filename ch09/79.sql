CREATE OR REPLACE MODEL ch09eu.txtclass_tf
OPTIONS (model_type='tensorflow',
         model_path='gs://bucket/some/dir/1549825580/*')