package vn.tayjava;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import vn.tayjava.model.Animal;
import vn.tayjava.service.DBConnectionService;
import vn.tayjava.service.KafkaConnectionService;

@SpringBootApplication
public class TayJavaApplication implements CommandLineRunner {

    @Autowired
    private Animal animal;

    @Autowired
    @Qualifier("cat")
    private Animal cat;

	@Autowired
	private DBConnectionService dbConnectionService;

	@Autowired
	private KafkaConnectionService kafkaConnectionService;

	public static void main(String[] args) {
		SpringApplication.run(TayJavaApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		 animal.shouting();
		 cat.shouting();

		System.out.println();
		System.out.println("=== dbConnectionService class name: =========> " + dbConnectionService.getClass());

		System.out.println();
		System.out.println("=== kafkaConnectionService class name: =========> " + kafkaConnectionService.getClass());

	}
}
