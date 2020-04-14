logLevel := Level.Debug

name := "app"
version := "1.0"
scalaVersion := "2.11.0"

val sparkVersion = "2.4.5"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % sparkVersion % "provided",
  "org.apache.spark" %% "spark-sql" % sparkVersion % "provided",
  // "org.apache.spark" %% "spark-hive" % sparkVersion % "provided",
  // "org.apache.spark" %% "spark-mllib" % sparkVersion % "provided",
  // "org.apache.spark" %% "spark-avro" % sparkVersion % "provided",
  // "org.apache.spark" %% "spark-graphx" % sparkVersion % "provided",
  // "org.apache.spark" %% "spark-streaming" % sparkVersion % "provided",
  // "org.apache.spark" %% "spark-streaming-kafka" % "1.6.3" % "provided"
)
