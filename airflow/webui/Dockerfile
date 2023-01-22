FROM  airflow-base:0.1

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 9090

HEALTHCHECK --start-period=10s CMD [ -f ${AIRFLOW_HOME}/airflow-webserver.pid ] || exit 1

USER airflow
WORKDIR ${AIRFLOW_HOME}

ENTRYPOINT ["/usr/local/bin/startup.sh"]
