package demo.service;

import demo.model.Student;

public interface StudentService extends GenericService<Student, Integer> {

    boolean register(Student student, String lastIp);
}