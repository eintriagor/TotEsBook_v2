package cat.xtec.ioc.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Column;
import jakarta.persistence.Table;
import jakarta.persistence.Id;

@Entity
@Table(name = "Llibres")
public class Llibre {

    @Id
    String isbn;
    String titol;
    String autor;
    String editorial;
    String categoria;

    @Column(columnDefinition = "TEXT")
    String sinopsis;

    String imatgeUrl;

    // Constructor buit requerit per JPA
    public Llibre() {

    }

    // Constructor
    public Llibre(String isbn, String titol, String autor, String editorial, String categoria, String sinopsis, String imatgeUrl) {
        this.isbn = isbn;
        this.titol = titol;
        this.autor = autor;
        this.editorial = editorial;
        this.categoria = categoria;
        this.sinopsis = sinopsis;
        this.imatgeUrl = imatgeUrl;
    }

    // Getters i Setters
    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitol() {
        return titol;
    }

    public void setTitol(String titol) {
        this.titol = titol;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public String getImatgeUrl() {
        return imatgeUrl;
    }

    public void setImatgeUrl(String imatgeUrl) {
        this.imatgeUrl = imatgeUrl;
    }

    @Override
    public String toString() {
        return "Llibre{"
                + "isbn='" + isbn + '\''
                + ", titol='" + titol + '\''
                + ", autor='" + autor + '\''
                + ", sinopsis='" + sinopsis + '\''
                + ", imatgeUrl='" + imatgeUrl + '\''
                + '}';
    }
}
