
# ---- Base: JDK 17 oficial ----
FROM eclipse-temurin:17-jdk

# Variables d'entorn
ENV GLASSFISH_HOME=/opt/glassfish7
ENV PATH=$GLASSFISH_HOME/bin:$PATH

# ---- Eines del sistema + certificats del SO ----
RUN apt-get update && \
    apt-get install -y wget unzip ca-certificates iputils-ping netcat-openbsd && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# ---- Instal·lació de GlassFish 7.0.14 ----
RUN wget -q https://github.com/eclipse-ee4j/glassfish/releases/download/7.0.14/glassfish-7.0.14.zip && \
    unzip -q glassfish-7.0.14.zip -d /opt && \
    rm glassfish-7.0.14.zip

# ---- Connector JDBC MySQL ----
RUN wget -q https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.0.33.zip && \
    unzip -q mysql-connector-j-8.0.33.zip -d /opt && \
    cp /opt/mysql-connector-j-8.0.33/mysql-connector-j-8.0.33.jar $GLASSFISH_HOME/glassfish/lib/ && \
    rm -rf /opt/mysql-connector-j-8.0.33*

# JDK 17 JA UTILITZA el trustStore correcte -> JA NO CAL JAVA_TOOL_OPTIONS

# ---- Pool JDBC (sense canvis) ----
RUN asadmin start-domain && \
    asadmin create-jdbc-connection-pool \
      --datasourceclassname=com.mysql.cj.jdbc.MysqlDataSource \
      --restype=javax.sql.DataSource \
      --property user=totesuser:password=totespass:DatabaseName=totesbook:ServerName=db:PortNumber=3306 \
      TotEsBookPool && \
    asadmin create-jdbc-resource --connectionpoolid TotEsBookPool jdbc/TotEsBookDS && \
    asadmin set resources.jdbc-connection-pool.TotEsBookPool.property.useSSL=false && \
    asadmin set resources.jdbc-connection-pool.TotEsBookPool.property.requireSSL=false && \
    asadmin set resources.jdbc-connection-pool.TotEsBookPool.property.allowPublicKeyRetrieval=true && \
    asadmin set resources.jdbc-connection-pool.TotEsBookPool.property.serverTimezone=UTC && \
    asadmin stop-domain

# ---- Exposa ports ----
EXPOSE 8080 4848

# ---- Inicia GlassFish ----
CMD ["asadmin", "start-domain", "-v"]
