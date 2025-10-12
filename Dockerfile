# Base: JDK 21 oficial
FROM eclipse-temurin:21-jdk

# Variables d'entorn
ENV GLASSFISH_HOME=/opt/glassfish7
ENV PATH=$GLASSFISH_HOME/bin:$PATH

# Instal·la eines bàsiques (ping, nc, wget, unzip)
RUN apt-get update && apt-get install -y iputils-ping netcat-openbsd wget unzip && apt-get clean

# Instal·la GlassFish
RUN wget https://github.com/eclipse-ee4j/glassfish/releases/download/7.0.14/glassfish-7.0.14.zip && \
    unzip glassfish-7.0.14.zip -d /opt && \
    rm glassfish-7.0.14.zip

# Instal·la el connector JDBC de MySQL
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.0.33.zip && \
    unzip mysql-connector-j-8.0.33.zip -d /opt && \
    cp /opt/mysql-connector-j-8.0.33/mysql-connector-j-8.0.33.jar $GLASSFISH_HOME/glassfish/lib/ && \
    rm -rf /opt/mysql-connector-j-8.0.33*

# Desa i aplica la master password al domini existent
RUN echo "AS_ADMIN_MASTERPASSWORD=changeit" > /tmp/master-password.txt && \
    echo "AS_ADMIN_NEWMASTERPASSWORD=mypass" >> /tmp/master-password.txt && \
    asadmin stop-domain || true && \
    asadmin change-master-password --savemasterpassword=true \
    --passwordfile /tmp/master-password.txt domain1 && \
    rm /tmp/master-password.txt && \
    asadmin start-domain && \
    asadmin stop-domain

# Regenera completament el keystore amb nova contrasenya
RUN rm -f $GLASSFISH_HOME/glassfish/domains/domain1/config/keystore.jks && \
    keytool -genkeypair \
    -alias s1as \
    -keyalg RSA \
    -keysize 2048 \
    -validity 3650 \
    -keystore $GLASSFISH_HOME/glassfish/domains/domain1/config/keystore.jks \
    -storepass mypass \
    -keypass mypass \
    -dname "CN=localhost, OU=GlassFish, O=Eclipse, L=Local, S=None, C=US"

# Configura el domini perquè usi el keystore correctament
RUN sed -i '/<java-config / a\    <jvm-options>-Djavax.net.ssl.keyStorePassword=mypass</jvm-options>' \
    $GLASSFISH_HOME/glassfish/domains/domain1/config/domain.xml

# Crea el pool JDBC, el recurs JNDI i ajusta propietats de connexió
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

# Copia el WAR per autodeploy
COPY target/TotEsBook-1.0-SNAPSHOT.war \
     $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/TotEsBook.war

# Exposa ports
EXPOSE 8080 4848

# Inicia GlassFish
CMD ["asadmin", "start-domain", "-v"]
