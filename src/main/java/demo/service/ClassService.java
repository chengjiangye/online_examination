package demo.service;

import demo.model.Class;

public interface ClassService extends GenericService<Class, Integer> {

    Class queryStudentsByClassId(int id);
}