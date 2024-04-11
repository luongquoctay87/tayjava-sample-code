package vn.tayjava.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import vn.tayjava.configuration.Translator;
import vn.tayjava.dto.request.UserRequestDTO;
import vn.tayjava.dto.response.ResponseData;

import java.util.List;

@RestController
@RequestMapping("/user")
@Validated
@Slf4j
@Tag(name = "User Controller")
public class UserController {

    @Operation(method = "POST", summary = "Add new user", description = "Send a request via this API to create new user")
    @PostMapping(value = "/")
    public ResponseData<Integer> addUser(@Valid @RequestBody UserRequestDTO user) {
        log.info("Request add user, {} {}", user.getFirstName(), user.getLastName());
        return new ResponseData<>(HttpStatus.CREATED.value(), Translator.toLocale("user.add.success"), 1);
    }

    @Operation(summary = "Update user", description = "Send a request via this API to update user")
    @PutMapping("/{userId}")
    public ResponseData<?> updateUser(@PathVariable @Min(1) int userId, @Valid @RequestBody UserRequestDTO user) {
        log.info("Request update userId={}", userId);
        return new ResponseData<>(HttpStatus.ACCEPTED.value(), Translator.toLocale("user.upd.success"));
    }

    @Operation(summary = "Change status of user", description = "Send a request via this API to change status of user")
    @PatchMapping("/{userId}")
    public ResponseData<?> updateStatus(@Min(1) @PathVariable int userId, @RequestParam boolean status) {
        log.info("Request change status, userId={}", userId);
        return new ResponseData<>(HttpStatus.ACCEPTED.value(), Translator.toLocale("user.change.success"));
    }

    @Operation(summary = "Delete user permanently", description = "Send a request via this API to delete user permanently")
    @DeleteMapping("/{userId}")
    public ResponseData<?> deleteUser(@PathVariable @Min(value = 1, message = "userId must be greater than 0") int userId) {
        log.info("Request delete userId={}", userId);
        return new ResponseData<>(HttpStatus.NO_CONTENT.value(), Translator.toLocale("user.del.success"));
    }

    @Operation(summary = "Get user detail", description = "Send a request via this API to get user information")
    @GetMapping("/{userId}")
    public ResponseData<UserRequestDTO> getUser(@PathVariable @Min(1) int userId) {
        log.info("Request get user detail, userId={}", userId);
        return new ResponseData<>(HttpStatus.OK.value(), "user", new UserRequestDTO("Tay", "Java", "admin@tayjava.vn", "0123456789"));
    }

    @Operation(summary = "Get list of users per pageNo", description = "Send a request via this API to get user list by pageNo and pageSize")
    @GetMapping("/list")
    public ResponseData<List<UserRequestDTO>> getAllUsers(@RequestParam(defaultValue = "0", required = false) int pageNo,
                                                         @Min(10) @RequestParam(defaultValue = "20", required = false) int pageSize) {
        log.info("Request get all of users");
        return new ResponseData<>(HttpStatus.OK.value(), "users", List.of(new UserRequestDTO("Tay", "Java", "admin@tayjava.vn", "0123456789"),
                new UserRequestDTO("Leo", "Messi", "leomessi@email.com", "0123456456")));
    }
}
