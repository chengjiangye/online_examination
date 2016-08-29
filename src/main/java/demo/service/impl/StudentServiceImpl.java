package demo.service.impl;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Student;
import demo.service.StudentService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class StudentServiceImpl extends GenericServiceImpl<Student, Integer> implements StudentService {

    @Autowired
    public StudentServiceImpl(GenericDao<Student, Integer> genericDao) {
        super(genericDao);
    }

    @Override
    public boolean register(Student student, String lastIp) {
        if (genericDao.query("student.queryStudentByEmail", student.getEmail().trim()) == null) {
            StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
            student.setPassword(encryptor.encryptPassword(student.getPassword()));
            student.setLastIp(lastIp);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            student.setLastLogin(simpleDateFormat.format(new Date()));
            genericDao.create(student);
            return true;
        }
        return false;
    }

    @Override
    public Student login(Student student) {
        String plainPassword = student.getPassword();
        student = genericDao.query("student.queryStudentByEmail", student.getEmail().trim());
        if (student != null) {
            String encryptedPassword = student.getPassword();
            StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
            if (encryptor.checkPassword(plainPassword, encryptedPassword)) {
                return student;
            }
        }
        return null;
    }
}