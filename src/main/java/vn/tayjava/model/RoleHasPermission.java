package vn.tayjava.model;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class RoleHasPermission extends AbstractEntity {

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    @ManyToOne(targetEntity = Role.class)
    @JoinColumn(name = "permission_id")
    private Permission permission;
}
