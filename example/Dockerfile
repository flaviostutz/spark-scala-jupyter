FROM flaviostutz/spark-scala-jupyter:1.0.1

ADD /app /app
WORKDIR /app
RUN sbt package && \
    mv /app/target/scala-2.11/app_2.11-1.0.jar /app/app.jar && \
    rm -rf /app/target

ADD notebooks /

VOLUME /notebooks

EXPOSE 8888

CMD [ "/startup.sh" ]

