from pyspark.sql.functions import mean,max,min,col,count
from pyspark import SparkSession

spark = (
 SparkSession.builder.appName("ExerciseSpark")
    .getOrCreate()
)

#ler os dados do enem 2020
enem = (
    spark
    .read
    .format("csv")
    .option("header",True)
    .option("inferSchema",True)
    .option("delimiter",";")
    .load("s3://datalake-gustavo-igti-edc/raw_data/enem/year=2019/")
)


(

    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("NU_ANO")
    .save("s3://datalake-gustavo-igti-edc/staging/enem")
)