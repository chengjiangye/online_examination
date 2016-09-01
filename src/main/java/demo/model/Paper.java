package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class Paper extends BaseModel {

    private Integer id;
    private int time;
    private int score;
    private int teacherId;
    private int courseId;
}