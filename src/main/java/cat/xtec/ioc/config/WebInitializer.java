package cat.xtec.ioc.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        // Configuració de backend (JPA, Services, etc.)
        return new Class<?>[] { JpaConfig.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        // Configuració de Spring MVC
        return new Class<?>[] { WebConfig.class };
    }

    @Override
    protected String[] getServletMappings() {
        // Mapeig del DispatcherServlet (com en web.xml)
        return new String[] { "/" };
    }
}
