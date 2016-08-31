package demo.service.impl;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Student;
import demo.service.StudentService;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

@Service
public class StudentServiceImpl extends GenericServiceImpl<Student, Integer> implements StudentService {

    @Autowired
    public StudentServiceImpl(GenericDao<Student, Integer> genericDao) {
        super(genericDao);
    }

    @Override
    public String register(Student student, HttpServletRequest request, MultipartFile photoFile) {
        String photoName;
        if (photoFile.isEmpty()) {
            photoName = student.getGender().equals("男") ? "male_default.png" : "female_default.png";
        } else {
            if (!Arrays.asList(MIME_ARRAY).contains(photoFile.getContentType())) {
                return "照片类型错误";
            }
            if (photoFile.getSize() > MAX_PHOTO_SIZE_BYTES) {
                return "照片超过了1M";
            }
            String photoPath = request.getServletContext().getRealPath(PHOTO_PATH);
            photoName = String.valueOf(System.currentTimeMillis())
                    .concat(".")
                    .concat(StringUtils.getFilenameExtension(photoFile.getOriginalFilename()));
            try {
                photoFile.transferTo(new File(photoPath, photoName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        student.setPhoto(photoName);
        if (genericDao.query("student.queryStudentByEmail", student.getEmail().trim()) != null) {
            return "邮件地址已经存在";
        }
        StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
        student.setPassword(encryptor.encryptPassword(student.getPassword()));
        student.setLastIp(request.getRemoteAddr());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        student.setLastLogin(simpleDateFormat.format(new Date()));
        genericDao.create(student);
        return null;
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