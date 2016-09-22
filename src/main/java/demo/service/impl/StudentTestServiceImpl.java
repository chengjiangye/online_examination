package demo.service.impl;

import demo.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.StudentTest;
import demo.service.StudentTestService;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Service
public class StudentTestServiceImpl extends GenericServiceImpl<StudentTest, Integer> implements StudentTestService {

    @Autowired
    public StudentTestServiceImpl(GenericDao<StudentTest, Integer> genericDao) {
        super(genericDao);
    }

    @Override
    public void submit(HttpServletRequest request, MultipartFile[] files) {
        Student student = (Student) request.getSession().getAttribute("student");
        int studentId = student.getId();

        // 一二三部分
        Map<String, String[]> map = request.getParameterMap();
        for (String testIdString : map.keySet()) {
            int testId = Integer.parseInt(testIdString);
            StudentTest studentTest = new StudentTest(null, map.get(testIdString)[0], 0, studentId, testId, null);
            genericDao.create(studentTest);
        }

        // 编程题
        for (MultipartFile file : files) {
            String photoPath = request.getServletContext().getRealPath(CODE_PATH);
            String extension = StringUtils.getFilenameExtension(file.getOriginalFilename());
            String codeName = String.valueOf(System.nanoTime())
                    .concat(".")
                    .concat(extension);
            try {
                file.transferTo(new File(photoPath, codeName));
                int testId = Integer.parseInt(file.getOriginalFilename().replace("." + extension, ""));
                StudentTest studentTest = new StudentTest(null, codeName, 0, studentId, testId, null);
                genericDao.create(studentTest);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}