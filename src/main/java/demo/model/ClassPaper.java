package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class ClassPaper extends BaseModel {

    private Integer id;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;
    private String status;
    private int classId;
    private int paperId;
    private int assistantId;

    private Class clazz;
    private Paper paper;
    private Assistant assistant;
}