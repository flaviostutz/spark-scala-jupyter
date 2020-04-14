# spark-scala-jupyter
Jupyter notebook server prepared for running Spark with Scala kernels on a remote Spark master

## Usage

* Create docker-compose.yml

```yml
version: "3.5"
services:
  spark-scala-jupyter:
    image: flaviostutz/spark-scala-jupyter
    ports:
      - 8888:8888
      - 6006:6006
    # volumes:
    #   - /notebooks:/notebooks
    environment:
      - JUPYTER_TOKEN=flaviostutz
      - SPARK_MASTER=spark://spark-master:7077

  #SPARK SERVICES
  spark-master:
    image: bde2020/spark-master:2.4.5-hadoop2.7
    ports:
      - "8080:8080"
      - "7077:7077"
    environment:
      - INIT_DAEMON_STEP=setup_spark

  spark-worker:
    image: bde2020/spark-worker:2.4.5-hadoop2.7
    environment:
      - SPARK_MASTER=spark://spark-master:7077
```

* Run ```docker-compose up -d```

* Open Jupyter at http://localhost:8888

* Create a new Notebook with kernel Scala Spark Toree with contents

```scala
import org.apache.spark.SparkConf
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.SaveMode

import org.apache.hadoop.conf.Configuration
import org.apache.hadoop.fs.FileSystem
import org.apache.hadoop.fs.Path

println("Initializing Spark context...")
val conf = new SparkConf().setAppName("Example App")
val spark: SparkSession = SparkSession.builder.config(conf).getOrCreate()

println("************")
println("Hello, world!")
val rdd = spark.sparkContext.parallelize(Array(1 to 1000))
println(rdd.count())
println("************")
```

* Open Spark Master UI at http://localhost:8080

* View running App (from Jupyter notebook execution!)

## ENVs

* JUPYTER_TOKEN - shared password key for accessing jupyter notebooks. defaults to ''

* SPARK_MASTER - Spark master locations. Ex.: "spark://spark-master:7077". defaults to "local[*]"

