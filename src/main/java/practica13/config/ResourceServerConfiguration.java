package practica13.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@Configurable
@EnableGlobalMethodSecurity(securedEnabled = true)
public class ResourceServerConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    public UserDetailsService userDetailsService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Autowired
    private DataSource dataSource;



    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {


        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select username, password, active from usuario where username = ?")
                .authoritiesByUsernameQuery("select u.username, r.nombre_rol from usuario u inner join rol r on u.rol_id = r.id where u.username = ?")
                .passwordEncoder(bCryptPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //Marcando las reglas para permitir unicamente los usuarios
        http
                .authorizeRequests()
                .antMatchers("/assets/**", "/javascripts/**",  "/img/**").permitAll() //permitiendo llamadas a esas urls.
                .antMatchers("/h2/**").permitAll()
                .antMatchers("/").hasAnyAuthority("ADMIN","Vendedor")
                .antMatchers("/usuarios/**","/roles/**").hasAnyAuthority("ADMIN")
                .antMatchers("/encuestas/**").hasAnyAuthority("Participante", "ADMIN")
                .and()
                .formLogin()
                .loginPage("/login") //indicando la ruta que estaremos utilizando.
                .failureUrl("/login?error") //en caso de fallar puedo indicar otra pagina.
                .defaultSuccessUrl("/")
                .permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/login")
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .permitAll();

        //deshabilitando las seguridad contra los frame internos.
        //Necesario para H2.
        http.csrf().disable();
        http.headers().frameOptions().disable();
    }
    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return super.userDetailsService();
    }


    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    }

}
