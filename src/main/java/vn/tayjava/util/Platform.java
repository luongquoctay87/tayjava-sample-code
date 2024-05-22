package vn.tayjava.util;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;

@Getter
public enum Platform {
    @JsonProperty("web")
    WEB,
    @JsonProperty("android")
    ANDROID,
    @JsonProperty("ios")
    IOS,
    @JsonProperty("miniApp")
    MINI_APP
}
