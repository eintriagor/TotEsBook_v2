package cat.xtec.ioc.domain;

import jakarta.persistence.Entity;
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
    

    // Constructor
    public Llibre() {
        // Constructor buit requerit per JPA
    }

    // Constructor
    public Llibre(String isbn, String titol, String autor, String editorial, String categoria) {
        this.isbn = isbn;
        this.titol = titol;
        this.autor = autor;
        this.editorial = editorial;
        this.categoria = categoria;
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

    @Override
    public String toString() {
        return isbn + " - " + titol + " - " + autor + " - " + categoria;
    }
}
