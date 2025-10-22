package cat.totesbook.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import cat.totesbook.config.JpaConfig;
import cat.totesbook.config.WebConfig;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        // Configuració de backend (JPA, Services, etc.)
        return new Class<?>[] { cat.totesbook.config.JpaConfig.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        // Configuració de Spring MVC
        return new Class<?>[] { cat.totesbook.config.WebConfig.class };
    }

    @Override
    protected String[] getServletMappings() {
        // Mapeig del DispatcherServlet (com en web.xml)
        return new String[] { "/" };
    }
}
