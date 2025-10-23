package cat.totesbook.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SegurConfig {
    
    // Asegúrate de inyectar tu servicio que cargará usuarios de la DB
    private final UserDetailsService userDetailsService;

    public SegurConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    // Encriptació de contrasenyes
    @Bean
    public static PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // Protecció de rutes y controlar l'accé per rol
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests((requests) -> requests
                // Protecció de rutes y asignació de permissos
                .requestMatchers("/", "/css/**", "/js/**", "/registro", "/ficha/**").permitAll()
                .requestMatchers("/admin/**", "/estadisticas/**").hasAuthority("ADMINISTRADOR")
                .requestMatchers("/bibliotecario/**", "/prestamos/**").hasAnyAuthority("ADMINISTRADOR", "BIBLIOTECARIO")
                .requestMatchers("/usuario/**", "/reservar/**").hasAnyAuthority("ADMINISTRADOR", "BIBLIOTECARIO", "USUARIO")
                // Qualsevol altre petició requereix autenticació
                .anyRequest().authenticated()
            )
            .formLogin((form) -> form
                // Redirecció desde la pàgina d'inici homepage 
                .loginPage("/") 
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/dashboard", true) // Redirecciona al dashboard de roles
                .permitAll()
            )
            .logout((logout) -> logout
                // Implementació de logout segur
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/?logout=true") // Muestra confirmación de cierre
                .invalidateHttpSession(true) 
                .deleteCookies("JSESSIONID") // Funcionalidad para gestionar sesiones seguras
                .permitAll()
            );

        return http.build();
    }
}