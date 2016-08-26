package demo.service.impl;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Teacher;
import demo.service.TeacherService;

@Service
public class TeacherServiceImpl extends GenericServiceImpl<Teacher, Integer> implements TeacherService {

    @Autowired
    public TeacherServiceImpl(GenericDao<Teacher, Integer> genericDao) {
        super(genericDao);
    }

    @Override
    public Teacher login(Teacher teacher) {
        String plainPassword = teacher.getPassword();
        teacher = genericDao.query("teacher.queryTeacherByEmail", teacher.getEmail());
        if (teacher != null) {
            String encryptedPassword = teacher.getPassword();
            StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
            if (encryptor.checkPassword(plainPassword, encryptedPassword)) {
                return teacher;
            }
        }
        return null;
    }
}