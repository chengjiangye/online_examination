package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class Class extends BaseModel {

    private Integer id;
    private String title;
    private String start;
    private String finish;
}