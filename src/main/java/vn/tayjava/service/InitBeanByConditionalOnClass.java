package vn.tayjava.service;


import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Configuration;

/**
 * Khoi tao bean InitBeanByConditionalOnClass khi va chi khi class SomeOne ton tai trong classpath
 */
@Configuration
@ConditionalOnClass(name = "vn.tayjava.model.SomeOne")
public class InitBeanByConditionalOnClass {
}
