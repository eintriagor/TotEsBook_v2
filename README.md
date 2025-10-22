TotEsBook

Aplicació web desenvolupada amb Jakarta EE 10, desplegada en un contenidor GlassFish 7 i utilitzant MySQL 8 com a base de dades.
El projecte està completament contenidoritzat amb Docker i incorpora un multi-stage build per compilar automàticament el codi Java amb JDK 21 dins la imatge.
No cal tenir instal·lat ni Java ni Maven localment — només Docker Desktop.

Requisits previs:
        Abans d’executar el projecte, assegura’t de tenir instal·lat:
        Docker Desktop

Estructura del projecte:
        TotEsBook/
        │
        ├── docker-compose.yml   # Orquestració dels contenidors (App + BD + Adminer)
        ├── Dockerfile           # Multi-stage build: compila i desplega el .war dins GlassFish
        ├── pom.xml              # Configuració Maven del projecte
        ├── src/                 # Codi font Java, JSP, CSS, JS...
        ├── db/init.sql          # Script d’inicialització de la base de dades
        └── README.md            # Aquest document

La carpeta target/ i el .war no estan al repositori — es generen dins Docker.


Execució del projecte:
Clona el repositori a dintre de la carpeta desitjada:
        git clone https://github.com/DawProjecteFinal/TotEsBook.git
        Situar-se a la carpeta del projecte i executar el pas següent

Construeix i executa els contenidors
        docker compose up -d

Docker compilarà el projecte amb JDK 21 i Maven dins la imatge i desplegarà l’aplicació en GlassFish. Crearà automàticament la base de dades i Adminer.


Accés a l’aplicació:
        Aplicació web:              http://localhost:8080/TotEsBook
        Adminer (gestió BD):        hhttp://localhost:8081
        Consola GlassFish           http://localhost:4848

Configuració de la base de dades:
        Host	db
        Port	3306
        Base de dades	totesbook
        Usuari	totesuser
        Contrasenya	totespass
        Root password	root