package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class Admin extends BaseModel {

    private Integer id;
    private String email;
    private String username;
    private String password;
}