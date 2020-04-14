## Complete example

In the example, we compile a jar with custom class app.Point so that you can use this library in Notebook. Maven library dependencies can be added to your project by using Toree directives. If you need to create a fat jar (with classes from various jars), you have to use "assembly" plugin. Refer to how https://github.com/flaviostutz/spark-submit-scala is built for a reference.

We use a volume in /notebooks so that the same notebooks being edited in Jupyter are accessible in your host. This way you can use git to commit them to repository or use another editing tool besides Jupyter. This folder must be present in final container by adding its contents during Dockerfile build ("ADD notebooks /"). You can check these both in Dockerfile and docker-compose.yml.

You can simply copy this directory to your own workspace and start coding.

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
```
