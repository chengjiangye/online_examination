package demo.service;

import demo.model.Student;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface StudentService extends GenericService<Student, Integer> {

    String PHOTO_PATH = "/static/photo";

    String register(Student student, HttpServletRequest request, MultipartFile photoFile);

    Student login(Student student);
}