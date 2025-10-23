package cat.totesbook.model;
import jakarta.persistence.*;
import java.util.Set;
@Entity @Table(name="usuaris")
public class Usuari {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nom;
    private String email;
    private String contrasenya;
    private String rol;
    
    @Column(nullable = false)
    private String pass; // La contrasenya ha de ser xifrada

    @ElementCollection(targetClass = Rol.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "usuari_roles", joinColumns = @JoinColumn(name = "usuari_id"))
    @Enumerated(EnumType.STRING)
    private Set<Rol> roles;
    
    public Long getId(){
        return id;
    } 
    
    public void setId(Long id){
        this.id=id;
    }
    
    public String getNom(){
        return nom;
    } 
    
    public void setNom(String nom){
        this.nom=nom;
    }
    
    public String getEmail(){
        return email;
    } 
    
    public void setEmail(String email){
        this.email=email;
    }
    
    public String getContrasenya(){
        return contrasenya;
    } 
    
    public void setContrasenya(String c){
        this.contrasenya=c;
    }
    
    public String getRol(){
        return rol;
    } 
    
    public void setRol(String r){
        this.rol=r;
    }
}