package vn.tayjava.service;


import org.springframework.boot.autoconfigure.condition.ConditionalOnResource;
import org.springframework.context.annotation.Configuration;

/**
 * Khoi tao bean InitBeanByConditionalOnResource khi file application.properties khon ton tai
 */
@Configuration
@ConditionalOnResource(resources = "/application.properties")
public class InitBeanByConditionalOnResource {
}
