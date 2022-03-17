resource "aws_s3_bucket" "datalake" {
  # parâmetros de configuração do recurso escolhido
  bucket = "datalake-gustavo-igti-edc-tf"
  # acl    = "private" (atualizando forma de declarar recursos conforme nova versão do Terraform:
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-4-upgrade)

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }

  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }
  #   }
  # }  
}


# atualizando forma de declarar recursos conforme nova versão do Terraform:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-4-upgrade)

resource "aws_s3_bucket_acl" "datalake" {
  bucket = aws_s3_bucket.datalake.id
  acl = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "datalake" {
  bucket = aws_s3_bucket.datalake.id

  rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
  }  
}

## Use case 2 - Use case 2 - Streaming de Eventos com Kinesis

resource "aws_s3_bucket" "stream" {
  bucket = "igti-gustavo-streaming-bucket"
 
  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_acl" "stream" {
  bucket = aws_s3_bucket.stream.id
  acl = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "stream" {
  bucket = aws_s3_bucket.stream.id

  rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
  }  
}