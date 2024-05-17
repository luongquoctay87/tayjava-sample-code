package vn.tayjava.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.tayjava.model.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {


    User findByEmail(String email);

    @Query(value = "select r from Role r inner join UserHasRole ur on r.id = ur.user.id where ur.id= :userId")
    List<User> findAllRolesByUserId(Long userId);
}
