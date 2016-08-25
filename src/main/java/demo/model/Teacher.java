package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class Teacher extends BaseModel {

    private Integer id;
    private String email;
    private String username;
    private String password;
}