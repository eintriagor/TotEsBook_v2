package cat.totesbook.model;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity @Table(name="prestecs")
public class Prestec {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne @JoinColumn(name="usuari_id") private Usuari usuari;
    @ManyToOne @JoinColumn(name="llibre_id") private Llibre llibre;
    private LocalDate dataInici;
    private LocalDate dataFi;
    
    private boolean retornat = false;
    
    public Long getId(){
        return id;
    } 
    
    public void setId(Long id){
        this.id=id;
    }
    
    public Usuari getUsuari(){
        return usuari;
    } 
    
    public void setUsuari(Usuari u){
        this.usuari=u;
    }
    
    public Llibre getLlibre(){
        return llibre;
    } 
    
    public void setLlibre(Llibre l){
        this.llibre=l;
    }
    
    public LocalDate getDataInici(){
        return dataInici;
    } 
    
    public void setDataInici(LocalDate d){
        this.dataInici=d;
    }
    
    public LocalDate getDataFi(){
        return dataFi;
    } 
    
    public void setDataFi(LocalDate d){
        this.dataFi=d;
    }
    
    public boolean isRetornat(){
        return retornat;
    } 
    
    public void setRetornat(boolean r){
        this.retornat=r;
    }
}