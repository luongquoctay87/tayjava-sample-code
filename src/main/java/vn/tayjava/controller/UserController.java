package vn.tayjava.controller;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import vn.tayjava.dto.request.UserRequestDTO;
import vn.tayjava.dto.response.ResponseFailure;
import vn.tayjava.dto.response.ResponseSuccess;

import java.util.List;

@RestController
@RequestMapping("/user")
@Validated
public class UserController {

    @PostMapping("/")
    public ResponseSuccess addUser(@Valid @RequestBody UserRequestDTO user) {
        System.out.println("Request add user " + user.getFirstName());

        try {
            return new ResponseSuccess(HttpStatus.CREATED, "User added successfully,", 1);
        } catch (Exception e) {
            return new ResponseFailure(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @PutMapping("/{userId}")
    public ResponseSuccess updateUser(@PathVariable @Min(1) int userId, @Valid @RequestBody UserRequestDTO user) {
        System.out.println("Request update userId=" + userId);

        try {
            return new ResponseSuccess(HttpStatus.ACCEPTED, "User updated successfully");
        } catch (Exception e) {
            return new ResponseFailure(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @PatchMapping("/{userId}")
    public ResponseSuccess updateStatus(@Min(1) @PathVariable int userId, @RequestParam boolean status) {
        System.out.println("Request change status, userId=" + userId);

        try {
            return new ResponseSuccess(HttpStatus.ACCEPTED, "User's status changed successfully");
        } catch (Exception e) {
            return new ResponseFailure(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @DeleteMapping("/{userId}")
    public ResponseSuccess deleteUser(@PathVariable @Min(value = 1, message = "userId must be greater than 0") int userId) {
        System.out.println("Request delete userId=" + userId);

        try {
            return new ResponseSuccess(HttpStatus.NO_CONTENT, "User deleted successfully");
        } catch (Exception e) {
            return new ResponseFailure(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @GetMapping("/{userId}")
    public ResponseSuccess getUser(@PathVariable @Min(1) int userId) {
        System.out.println("Request get user detail, userId=" + userId);

        try {
            return new ResponseSuccess(HttpStatus.OK, "user", new UserRequestDTO("Tay", "Java", "admin@tayjava.vn", "0123456789"));
        } catch (Exception e) {
            return new ResponseFailure(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @GetMapping("/list")
    public ResponseSuccess getAllUser(@RequestParam(defaultValue = "0", required = false) int pageNo,
                                                         @Min(10) @RequestParam(defaultValue = "20", required = false) int pageSize) {
        System.out.println("Request get all of users");
        return new ResponseSuccess(HttpStatus.OK, "users", List.of(new UserRequestDTO("Tay", "Java", "admin@tayjava.vn", "0123456789"),
                new UserRequestDTO("Leo", "Messi", "leomessi@email.com", "0123456456")));
    }
}
