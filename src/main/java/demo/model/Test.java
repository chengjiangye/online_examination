package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class Test extends BaseModel {

    private Integer id;
    private String type;
    private String question;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String answer;
    private int score;
    private int paperId;

    private Paper paper;
    private List<StudentTest> studentTests;
}