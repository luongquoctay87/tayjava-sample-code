package vn.tayjava.configuration;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import vn.tayjava.service.DBConnectionService;
import vn.tayjava.service.InitBeanByConditionalOnProperty;
import vn.tayjava.service.KafkaConnectionService;

@Configuration
public class AppConfig {

    /**
     * Khoi tao bean DBConnectionService khi va chi khi DBConnectionBean da duoc khoi tao
     *
     * @return
     */
    @Bean
    @ConditionalOnBean(DBConnectionBean.class)
    DBConnectionService dbConnectionService() {
        System.out.println("===> Init DBConnectionService successfully");
        return new DBConnectionService();
    }

    /**
     * Khoi tao bean KafkaConnectionService khi va chi khi bean KafkaConnectionBean khong ton tai
     *
     * @return
     */
    @Bean
    @ConditionalOnMissingBean(KafkaConnectionBean.class)
    KafkaConnectionService kafkaConnectionService() {
        System.out.println("===> Init kafkaConnectionService when KafkaConnectionBean is missed connection");
        return new KafkaConnectionService();
    }

    /**
     * Khoi tao SampleService khi va chi khi vn.tayjava.allowed ton tai trong application.properties voi gia tri la true
     *
     * @return
     */
    @Bean
    @ConditionalOnProperty(value = "vn.tayjava.allowed", // key nam trong file application.properties
            havingValue = "true", // Khoi tao bean voi gia tri true
            matchIfMissing = false) // Khong khoi tao bean khi gia tri la false
    InitBeanByConditionalOnProperty initBeanByConditionalOnProperty() {
        return new InitBeanByConditionalOnProperty();
    }

}
