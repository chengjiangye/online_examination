package demo.service;

import demo.model.Teacher;

public interface TeacherService extends GenericService<Teacher, Integer> {

    Teacher login(Teacher teacher);
}