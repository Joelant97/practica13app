package practica13.config;

import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;



@SpringBootConfiguration
public class HttpsessionConfig {

    RedisStandaloneConfiguration standaloneoconfig() {
        RedisStandaloneConfiguration standaloneoconfig = new RedisStandaloneConfiguration("redis", 6379);
        return standaloneoconfig;
    }

    @Bean
    JedisConnectionFactory jedisConnFactory() {

        JedisConnectionFactory jcf = new JedisConnectionFactory(standaloneoconfig());
        return jcf;

    }

    @Bean
    RedisTemplate<String, Object> redisTemplate() {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
        redisTemplate.setConnectionFactory(jedisConnFactory());

        return redisTemplate;

    }



}