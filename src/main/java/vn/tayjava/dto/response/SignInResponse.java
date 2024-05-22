package vn.tayjava.dto.response;

import lombok.Builder;
import lombok.Getter;

import java.io.Serializable;

@Getter
@Builder
public class SignInResponse implements Serializable {

    private String accessToken;
    private String refreshToken;

    private Long userId;
    private String phoneNumber;
    private String role;
    // more over ...
}
