FROM adoptopenjdk:11.0.11_9-jdk-openj9-0.26.0-focal

RUN apt-get update && apt-get install -y gnupg

RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add

RUN apt-get update && apt-get install -y sbt

WORKDIR /workdir
RUN sbt --verbose --version
WORKDIR /

CMD ["sbt"]