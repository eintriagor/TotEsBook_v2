# Base: JDK 21 oficial
FROM eclipse-temurin:21-jdk

# Variables
ENV GLASSFISH_HOME=/opt/glassfish7
ENV PATH=$GLASSFISH_HOME/bin:$PATH

# Descarrega i instal·la GlassFish 7.0.14
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://github.com/eclipse-ee4j/glassfish/releases/download/7.0.14/glassfish-7.0.14.zip && \
    unzip glassfish-7.0.14.zip -d /opt && \
    rm glassfish-7.0.14.zip && \
    apt-get clean

# Neteja aplicacions per defecte
RUN rm -rf $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/*

# Copia la teva aplicació
COPY target/TotEsBook-1.0-SNAPSHOT.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/TotEsBook.war

# Exposa ports
EXPOSE 8080 4848

# Inicia GlassFish
CMD ["asadmin", "start-domain", "-v"]
