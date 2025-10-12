package cat.xtec.ioc.config;

import jakarta.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.jndi.JndiTemplate;
import jakarta.persistence.spi.PersistenceProvider;

@Configuration
@EnableTransactionManagement
public class JpaConfig {

    @Bean
    public DataSource dataSource() throws Exception {
        // Obtenim el DataSource via JNDI (definit a GlassFish: jdbc/TotEsBookDS)
        return (DataSource) new JndiTemplate().lookup("jdbc/TotEsBookDS");
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
        LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
        emf.setDataSource(dataSource);

        // Nom de la persistence-unit del persistence.xml
        emf.setPersistenceUnitName("totesbookPersistenceUnit");

        // IMPORTANT: especificar el provider JPA (EclipseLink de GlassFish 7)
        emf.setPersistenceProviderClass(org.eclipse.persistence.jpa.PersistenceProvider.class);
        return emf;
    }

    @Bean
    public PlatformTransactionManager transactionManager(EntityManagerFactory emf) {
        // Transaccions JPA gestionades per Spring
        return new JpaTransactionManager(emf);
    }
}
