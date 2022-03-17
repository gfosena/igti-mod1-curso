# atualizando forma de declarar recursos conforme nova versão do Terraform:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-4-upgrade)

# resource "aws_s3_bucket_object" "job_spark" {
resource "aws_s3_object" "job_spark" {
  # bucket = aws_s3_bucket.datalake.id
  bucket = aws_s3_bucket.datalake.id

  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../job_emr.py"
  etag   = filemd5("../job_emr.py")

}

#aula Data LakeHouse com Delta Lake e EMR

#verificar se precisa tbm fazer adaptação no código, requerido versão 4 Terraform

# resource "aws_s3_bucket_object" "delta_insert" {
resource "aws_s3_object" "delta_insert" {
  bucket = aws_s3_bucket.datalake.id
  key = "emr-code/pyspark/01_delta_spark_insert.py"
  acl = "private"
  source = "../etl/01_delta_spark_insert.py"
  etag = filemd5("../etl/01_delta_spark_insert.py")
}

# resource "aws_s3_bucket_object" "delta_upsert" {
resource "aws_s3_object" "delta_upsert" {
  bucket = aws_s3_bucket.datalake.id
  key = "emr-code/pyspark/02_delta_spark_upsert.py"
  acl = "private"
  source = "../etl/02_delta_spark_upsert.py"
  etag = filemd5("../etl/02_delta_spark_upsert.py")
}