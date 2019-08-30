package practica13.Utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//
//@Configurable
//@EnableGlobalMethodSecurity(securedEnabled = true)
//public class Security extends WebSecurityConfigurerAdapter {
//
//    // JPA
//    @Qualifier("usuarioService")
//    @Autowired
//    private UserDetailsService userDetailsService;
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//
//        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//
//        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder);
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests().antMatchers("/css/**", "/js/**", "/webjars/**").permitAll() // permitiendo llamadas a esas urls.
//                .antMatchers("/dbconsole/**").permitAll().antMatchers("/admin/**").hasAnyRole("ADMIN", "USER")
//                .antMatchers("/index/**").hasAnyRole("ADMIN", "USER")
//                .antMatchers("/usuarios/**").hasAnyRole("ADMIN", "USER")
//                .anyRequest().authenticated()
//                .antMatchers("/**").fullyAuthenticated()
//                .and().formLogin().loginPage("/login")
//                .usernameParameter("username")
//                .passwordParameter("password")
//                .defaultSuccessUrl("/index")
//                .successForwardUrl("/index")
//                .failureUrl("/login?error")
//                .permitAll().and().logout().permitAll();
//
//        http.csrf().disable();
//        http.headers().frameOptions().disable();
//    }
//}
