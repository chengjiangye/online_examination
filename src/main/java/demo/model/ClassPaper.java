package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ClassPaper extends BaseModel {

    private Integer id;
    private String time;
    private String status;
    private int classId;
    private int paperId;
    private int assistantId;

    private Class clazz;
    private Paper paper;
    private Assistant assistant;
}