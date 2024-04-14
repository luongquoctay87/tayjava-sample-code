package vn.tayjava.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.tayjava.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
