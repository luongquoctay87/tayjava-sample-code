package vn.tayjava.service;

import vn.tayjava.dto.request.UserRequestDTO;
import vn.tayjava.dto.response.UserDetailResponse;
import vn.tayjava.util.UserStatus;

import java.util.List;

public interface UserService {

    long saveUser(UserRequestDTO request);

    void updateUser(long userId, UserRequestDTO request);

    void changeStatus(long userId, UserStatus status);

    void deleteUser(long userId);

    UserDetailResponse getUser(long userId);

    List<UserDetailResponse> getAllUsers(int pageNo, int pageSize, String sortBy);
}
