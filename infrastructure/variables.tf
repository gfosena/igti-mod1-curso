variable "aws_region" {
  default = "sa-east-1"
}

#criação de nova variável para o Use case 1 - Lakehouse com DeltaLake e EMR

variable "lambda_function_name" {
  default = "IGTIexecutaEMR"  
}

#criação de novas variáveis para o Use case 3 - Pipelines com Airflow

variable "key_pair_name" {
  default = "gustavo-igti-teste"
}

variable "airflow_subnet_id" {
  default = "subnet-00f2b6c87578c1bc5"
}

variable "vpc_id" {
  default = "vpc-0ce32d2f8f7d53e90"
}