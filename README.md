#  TotEsBook

Aplicació web desenvolupada amb **Jakarta EE 10**, **Spring MVC 6** i desplegada en un contenidor **GlassFish 7**.  
El projecte utilitza **Docker** per gestionar els serveis d’aplicació i base de dades (**MySQL 8**) de manera independent i portable.

---

##  Requisits previs

Abans d’executar el projecte, assegura’t de tenir instal·lat:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Java JDK 21](https://adoptium.net/) (per compilar el codi amb Maven) o JDK que sigui ≥ 17, però el recomanat és JDK 21

- [Apache Maven 3.9+](https://maven.apache.org/) *(opcional si treballes amb NetBeans, ja que inclou Maven integrat i es el mateix que fer "Clean and Build")*
- Opcional: [Git](https://git-scm.com/) per clonar el repositori

---

##  Estructura del projecte

TotEsBook/
│
├── docker-compose.yml # Orquestració dels contenidors (GlassFish + MySQL + Adminer)
├── Dockerfile # Construcció de la imatge personalitzada de l’aplicació
├── pom.xml # Configuració Maven del projecte
├── target/ # On Maven genera el .war
├── src/
│ ├── main/
│ │ ├── java/ # Codi font Java
│ │ ├── resources/ # Configuracions
│ │ └── webapp/ # JSP, HTML, CSS, JS...
│ └── test/ # Tests
└── README.md # Aquest document

---

## Construir el projecte

 Compila i empaqueta amb Maven o sino fer un Clean and Build amb Netbeans
    bash
mvn clean package

## Construeix les imatges Docker:
docker compose build
## Inicia els contenidors:
docker compose up -d

## Quan els contenidors estiguin en marxa:

Aplicació web: http://localhost:8080/TotEsBook
Consola GlassFish: http://localhost:4848/
Adminer (gestor MySQL): http://localhost:8081/

## Configuració de la base de dades
| Paràmetre     | Valor          |
| ------------- | -------------- |
| Host          | `totesbook_db` |
| Port          | `3306`         |
| Base de dades | `totesbook`    |
| Usuari        | `totesuser`    |
| Contrasenya   | `totespass`    |
| Root password | `root`         |

## Col·laboració
git clone https://github.com/<usuari>/<repositori>.git
cd TotEsBook
mvn clean package
docker compose up -d

## Aturar o reiniciar
docker compose down

Reiniciar completament:
docker compose down -v
docker compose up -d --build

## Notes finals
Si modifiquem el codi fer un Clean and Build desde Netbeans, per a actualitzar el .war de dintre de la carpeta  target
## Tecnologies: Jakarta EE · Spring MVC · GlassFish 7 · MySQL 8 · Docker
