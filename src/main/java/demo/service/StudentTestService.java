package demo.service;

import demo.model.StudentTest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface StudentTestService extends GenericService<StudentTest, Integer> {

    String CODE_PATH = "/static/code";

    void submit(HttpServletRequest request, MultipartFile[] files);
}