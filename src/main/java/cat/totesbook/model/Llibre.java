package cat.totesbook.model;
import jakarta.persistence.*;
@Entity @Table(name="llibres")
public class Llibre {
    
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String titol;
    private String autor;
    private String isbn;
    private boolean disponible = true;
    
    public Long getId(){
        return id;
    } 
    
    public void setId(Long id){
        this.id=id;
    }
    
    public String getTitol(){
        return titol;
    } 
    
    public void setTitol(String t){
        this.titol=t;
    }
    
    public String getAutor(){
        return autor;
    } 
    
    public void setAutor(String a){
        this.autor=a;
    }
    
    public String getIsbn(){
        return isbn;
    } 
    
    public void setIsbn(String i){
        this.isbn=i;
    }
    
    public boolean isDisponible(){
        return disponible;
    } 
    
    public void setDisponible(boolean d){
        this.disponible=d;
    }
}