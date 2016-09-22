package demo.model;

import lombok.*;

@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class StudentTest extends BaseModel {

    private Integer id;
    private String answer;
    private int score;
    private int studentId;
    private int testId;

    private Student student;
}