import boto3
import pandas as pd


#criar um client para interagir com a aws s3
s3_client = boto3.client('s3')

s3_client.download_file("datalake-gustavo-igti-edc",
                        "data/arq_teste.csv",
                        "data/arq_teste.csv")


s3_client.upload_file("data/arq_teste2.csv",
                       "datalake-gustavo-igti-edc",
                       "data/arq_teste2.csv" )





