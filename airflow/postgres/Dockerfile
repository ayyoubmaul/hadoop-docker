FROM postgres:10.3


ENV PGDATA /var/lib/postgresql/data/pgdata
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB postgres

ADD create-user.sql  /docker-entrypoint-initdb.d/

HEALTHCHECK CMD pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB} || exit 1
