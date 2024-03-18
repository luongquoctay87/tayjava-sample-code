package vn.tayjava.model;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Component
@Primary
public class Dog implements Animal {
    @Override
    public void shouting() {
        System.out.println("Con chó sửa gâu gâu !");
    }
}
