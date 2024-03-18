package vn.tayjava.model;

import org.springframework.stereotype.Component;

@Component
public class Cat implements Animal {
    @Override
    public void shouting() {
        System.out.println("Con mèo kêu meo meo !");
    }
}
