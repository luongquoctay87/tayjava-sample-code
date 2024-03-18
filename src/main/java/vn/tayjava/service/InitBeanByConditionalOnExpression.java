package vn.tayjava.service;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Configuration;

/**
 * Khoi tao bean InitBeanByConditionalOnExpression khi cac dieu kien phu hop voi gia tri trong file application.properties
 */
@Configuration
@ConditionalOnExpression(
        "${vn.tayjava.allowed:true} and ${vn.tayjava.enabled:true}"
)
public class InitBeanByConditionalOnExpression {
}
