package vn.tayjava.service;


import org.springframework.boot.autoconfigure.condition.ConditionalOnJava;
import org.springframework.boot.system.JavaVersion;
import org.springframework.context.annotation.Configuration;

/**
 * Khoi tao bean InitBeanByConditionalOnJava tron java version 17
 */
@Configuration
@ConditionalOnJava(JavaVersion.SEVENTEEN)
public class InitBeanByConditionalOnJava {
}
