FROM flaviostutz/spark-submit-scala:2.4.5.4

ENV SPARK_MASTER 'local[*]'
ENV JUPYTER_TOKEN ''

# Dependencies
RUN apk add ca-certificates libstdc++ python3 libzmq py3-zmq && \
    apk add --virtual=build_dependencies cmake gcc g++ make musl-dev python3-dev zeromq-dev && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h

# Jupyter
RUN python3 -m pip --no-cache-dir install requests notebook ipywidgets && \
    jupyter nbextension enable --py widgetsnbextension

# Apache Toree kernel
RUN pip3.7 install pyzmq
RUN pip3.7 install toree && \
    jupyter toree install --spark_home=/spark/ --kernel_name="Spark - Toree"

# # Spylon-kernel
# RUN pip3.7 install spylon-kernel && \
#     python3 -m spylon_kernel install

# Cleanup
RUN apk del --purge -r build_dependencies && \
    rm -rf /var/cache/apk/* && \
    mkdir /notebooks

ADD startup.sh /

VOLUME /notebooks

EXPOSE 8888

CMD [ "/startup.sh" ]

