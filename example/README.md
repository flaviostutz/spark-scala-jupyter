## Example

In this example we exercise the following:

* Compilation of a jar with custom class app.Point so that you can use this library in Notebook
  * If you need to create a fat jar (with classes from various jars), you have to use "assembly" plugin. Refer to how https://github.com/flaviostutz/spark-submit-scala is built for a reference.

* Adding Maven library dependencies directly in notebook 

* Notebook Kernel for running Spark with Scala on remote Spark Masters (Toree)

* Loading files from local storage to HDFS

* Loading and saving partitioned files in HDFS

* Visualizing graphically the contents of a Dataframe loaded from a file in HDFS

* Utilizing a notebook folder visible both inside Jupyter (by using volumes) and on your machine so that you can use other tools or git to commit changes during development
  * On the final building of the container for running in production, this folder must be added to the container itself (don't use volumes!)

* You can simply copy this directory to your own workspace and start coding

## Usage

* Copy this examples files to your project

* Update the docker-compose.yml file so that you use your own container name

* Run docker-compose up --build

* Open http://localhost:8888

* Create a new Notebook with the following contents:

```scala
//import your custom jar in the notebook with a special Toree directive
%AddJar file:///app/app.jar

//import a custom library from Maven (Vegas is a visualization lib)
%AddDeps org.vegas-viz vegas_2.11 0.3.11 --transitive
%AddDeps org.vegas-viz vegas-spark_2.11 0.3.11

println("Initializing Spark context...")
val conf = new SparkConf().setAppName("Example App")
val spark: SparkSession = SparkSession.builder.config(conf).getOrCreate()

println("************")
println("Hello, world!")
val rdd = spark.sparkContext.parallelize(Array(1 to 10))
rdd.count()
println("************")

println("Stop Spark session")
spark.stop()
```

* Run Notebook cells

* Open http://localhost:8080 and check for running Spark Applications according to notebook instances running

* For adding more Spark Workers, you can simply do

```docker-compose up --scale spark-worker=5```

* For an example of clustered HDFS with multiple namenodes/datanodes, go to https://github.com/flaviostutz/spark-scala-hdfs-docker-example/blob/master/docker-compose.yml
