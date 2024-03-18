package vn.tayjava.service;


import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingClass;
import org.springframework.context.annotation.Configuration;

/**
 * Khoi tao bean InitBeanByConditionalOnMissingClass khi va chi khi class SomeOne khong ton tai trong classpath
 */
@Configuration
@ConditionalOnMissingClass(value = "vn.tayjava.model.SomeOne")
public class InitBeanByConditionalOnMissingClass {
}
