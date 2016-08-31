package demo.service;

import demo.model.Student;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface StudentService extends GenericService<Student, Integer> {

    String PHOTO_PATH = "/static/photo";
    long MAX_PHOTO_SIZE_BYTES = 1024 * 1024;
    String[] MIME_ARRAY = {"image/png", "image/jpeg"};

    String register(Student student, HttpServletRequest request, MultipartFile photoFile);

    Student login(Student student);
}