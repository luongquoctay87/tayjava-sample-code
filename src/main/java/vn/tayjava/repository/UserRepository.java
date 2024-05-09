package vn.tayjava.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.tayjava.model.User;

import java.util.Collection;
import java.util.Date;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {

    @Query(value = "select * from User u inner join Address a on u.id = a.userId where a.city=:city")
    List<User> getAllUser(String city);

    // -- Distinct --
    // @Query(value = "select distinct from User u where u.firstName=:firstName and u.lastName=:lastName")
    List<User> findDistinctByFirstNameAndLastName(String firstName, String lastName);

    // -- Single field --
    //  @Query(value = "select * from User u where u.email= ?1")
    List<User> findByEmail(String email);

    // -- OR --
    //  @Query(value = "select * from User u where u.firstName=:name or u.lastName:name")
    List<User> findByFirstNameOrLastName(String name);

    // -- Is, Equals --
    //@Query(value = "select * from User u where u.firstName=:name")
    List<User> findByFirstNameIs(String name);

    List<User> findByFirstNameEquals(String name);

    List<User> findByFirstName(String name);

    // -- Between --
   // @Query(value = "select * from User u where u.createdAt between ?1 and 2?")
    List<User> findByCreatedAtBetween(Date startDate, Date endDate);

    // LessThan
    //@Query(value = "select * from User u where u.age < :age")
    List<User> findByAgeLessThan(int age);
    List<User> findByAgeLessThanEquals();
    List<User> findByAgeGreaterThan();
    List<User> findByAgeGreaterThanEquals();

    // Before va After
    //@Query(value = "select * from User u where u.createdAt < :date")
    List<User> findByCreatedAtBefore(Date date);
    List<User> findByCreatedAtAfter(Date date);

    // IsNull, Null
   // @Query(value = "select * from User u where u.age is null")
    List<User> findByAgeIsNull();

    // NotNull, IsNotNull
   // @Query(value = "select * from User u where u.age is not null")
    List<User> findByAgeNotNull();

    // Like
    //@Query(value = "select * from User u where u.lastName like %:lastName%")
    List<User> findByLastNameLike(String lastName);

   // @Query(value = "select * from User u where u.firstName not like %:lastName%")
    List<User> findByLastNameNotLike(String lastName);

    // StartingWith
    //@Query(value = "select * from User u where u.lastName not like :lastName%")
    List<User> findByLastNameStartingWith(String lastName);

    // EndingWith
    // @Query(value = "select * from User u where u.lastName not like %:lastName")
    List<User> findByLastNameEndingWith(String lastName);

    // Containing
    //@Query(value = "select * from User u where u.lastName not like %:lastName%")
    List<User> findByLastNameContaining(String name);

    // Not
   // @Query(value = "select * from User u where u.lastName <> :name")
    List<User> findByLastNameNot(String name);

    // In
    // @Query(value = "select * from User u where u.age in (18,25,30)")
    List<User> findByAgeIn(Collection<Integer> ages);

    // Not in
    //@Query(value = "select * from User u where u.age not in (18,25,30)")
    List<User> findByAgeNotIn(Collection<Integer> ages);

    // True/False
    //@Query(value = "select * from User u where u.activated=true")
    List<User> findByActivatedTrue();
    List<User> findByActivatedFalse();

    // IgnoreCase
    // @Query(value = "select * from User u where LOWER(u.lastName) <> LOWER(:name)")
    List<User> findByFirstNameIgnoreCase(String name);

    // order by
    List<User> findByFirstNameOrderByCreatedAtDesc(String name);

    //
    List<User> findByFirstNameAndLastNameAllIgnoreCase(String firstName, String lastName);
}
