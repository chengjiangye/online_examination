DROP DATABASE IF EXISTS db_examination;
CREATE DATABASE db_examination;

-- table admin
DROP TABLE IF EXISTS db_examination.admin;
CREATE TABLE db_examination.admin (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '系统管理员表';

INSERT INTO db_examination.admin VALUE (NULL, 'admin@tsinghua.edu.cn', '系统管理员',
                                        'Qckl0fvVHs9Id4rFngOFG+WBTJyrNwW5yxmshz5BpBoDFSMNC6Dxohh+7kZfTmit'); -- password: 123

-- table teacher
DROP TABLE IF EXISTS db_examination.teacher;
CREATE TABLE db_examination.teacher (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '教师员表';

-- table assistant
DROP TABLE IF EXISTS db_examination.assistant;
CREATE TABLE db_examination.assistant (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '教务表';

-- table class
DROP TABLE IF EXISTS db_examination.class;
CREATE TABLE db_examination.class (
  id     INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title  VARCHAR(255) NOT NULL
  COMMENT '班级名称',
  start  DATE         NOT NULL
  COMMENT '开班日期',
  finish DATE         NOT NULL
  COMMENT '结业日期'
)
  COMMENT '班级表';

-- table student
DROP TABLE IF EXISTS db_examination.student;
CREATE TABLE db_examination.student (
  id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email      VARCHAR(191) NOT NULL UNIQUE
  COMMENT '邮箱',
  username   VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password   VARCHAR(255) NOT NULL
  COMMENT '密码',
  gender     CHAR(1)      NOT NULL
  COMMENT '性别',
  dob        DATE         NOT NULL
  COMMENT '出生日期',
  phone      VARCHAR(255) COMMENT '电话',
  education  VARCHAR(255) COMMENT '学历',
  major      VARCHAR(255) COMMENT '专业',
  academy    VARCHAR(255) COMMENT '毕业院校',
  graduation DATE COMMENT '毕业日期',
  training   VARCHAR(1024) COMMENT '培训经历',
  experience VARCHAR(1024) COMMENT '工作经验',
  photo      VARCHAR(255) COMMENT '照片',
  remark     VARCHAR(1024) COMMENT '备注',
  card       VARCHAR(255) COMMENT '上机卡号',
  lastIp     VARCHAR(255) NOT NULL
  COMMENT '最后登录IP',
  lastLogin  DATETIME     NOT NULL
  COMMENT '最后登录时间',
  classId    INT UNSIGNED COMMENT 'FK 班级ID'
)
  COMMENT '学生表';

-- table course
DROP TABLE IF EXISTS db_examination.course;
CREATE TABLE db_examination.course (
  id    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title VARCHAR(255) NOT NULL
  COMMENT '课程名称'
)
  COMMENT '课程表';

INSERT INTO db_examination.course VALUE (NULL, '网页设计基础');
INSERT INTO db_examination.course VALUE (NULL, 'Java SE 程序设计');
INSERT INTO db_examination.course VALUE (NULL, '数据库基础');
INSERT INTO db_examination.course VALUE (NULL, 'Java EE 程序设计');
INSERT INTO db_examination.course VALUE (NULL, 'Java EE 框架技术');
INSERT INTO db_examination.course VALUE (NULL, 'Android 应用开发');
INSERT INTO db_examination.course VALUE (NULL, '证书考试');

-- table paper
DROP TABLE IF EXISTS db_examination.paper;
CREATE TABLE db_examination.paper (
  id        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  time      INT NOT NULL
  COMMENT '考试时间，分钟',
  score     INT NOT NULL
  COMMENT '总分',
  courseId  INT UNSIGNED COMMENT 'FK',
  teacherId INT UNSIGNED COMMENT 'FK'
)
  COMMENT '试卷表';

-- table test
DROP TABLE IF EXISTS db_examination.test;
CREATE TABLE db_examination.test (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  type     VARCHAR(255)  NOT NULL
  COMMENT '类型：选择题，填空题，简答题，编程题',
  question VARCHAR(2048) NOT NULL
  COMMENT '题目',
  optionA  VARCHAR(255) COMMENT '选项A',
  optionB  VARCHAR(255) COMMENT '选项B',
  optionC  VARCHAR(255) COMMENT '选项C',
  optionD  VARCHAR(255) COMMENT '选项D',
  answer   TEXT COMMENT '答案',
  score    INT           NOT NULL
  COMMENT '分数',
  paperId  INT UNSIGNED COMMENT 'FK'
)
  COMMENT '试题表';

-- table class_paper
DROP TABLE IF EXISTS db_examination.class_paper;
CREATE TABLE db_examination.class_paper (
  id          INT UNSIGNED          AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  time        DATETIME     NOT NULL
  COMMENT '考试时间',
  status      VARCHAR(255) NOT NULL DEFAULT '未考试'
  COMMENT '考试状态：未考试；考试中；考试结束；判卷结束',
  classId     INT UNSIGNED COMMENT 'FK',
  paperId     INT UNSIGNED COMMENT 'FK',
  assistantId INT UNSIGNED COMMENT 'FK'
)
  COMMENT '班级-试卷表';

-- table student_test
DROP TABLE IF EXISTS db_examination.student_test;
CREATE TABLE db_examination.student_test (
  id        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  answer    TEXT COMMENT '答案',
  score     INT COMMENT '得分',
  studentId INT UNSIGNED COMMENT 'FK',
  testId    INT UNSIGNED COMMENT 'FK'
)
  COMMENT '学生-试题表';

# ALTER TABLE db_examination.student_test
# ADD COLUMN score INT
# AFTER answer;

-- FOREIGN KEY ----------------------------------------------------------

ALTER TABLE db_examination.student
ADD CONSTRAINT
  fk_student_classId
FOREIGN KEY (classId)
REFERENCES db_examination.class (id);

ALTER TABLE db_examination.paper
ADD CONSTRAINT
  fk_paper_courseId
FOREIGN KEY (courseId)
REFERENCES db_examination.course (id);

ALTER TABLE db_examination.paper
ADD CONSTRAINT
  fk_paper_teacherId
FOREIGN KEY (teacherId)
REFERENCES db_examination.teacher (id);

ALTER TABLE db_examination.test
ADD CONSTRAINT
  fk_test_paperId
FOREIGN KEY (paperId)
REFERENCES db_examination.paper (id);

ALTER TABLE db_examination.class_paper
ADD CONSTRAINT
  fk_class_paper_classId
FOREIGN KEY (classId)
REFERENCES db_examination.class (id);

ALTER TABLE db_examination.class_paper
ADD CONSTRAINT
  fk_class_paper_paperId
FOREIGN KEY (paperId)
REFERENCES db_examination.paper (id);

ALTER TABLE db_examination.class_paper
ADD CONSTRAINT
  fk_class_paper_assistantId
FOREIGN KEY (assistantId)
REFERENCES db_examination.assistant (id);

ALTER TABLE db_examination.student_test
ADD CONSTRAINT
  fk_student_test_studentId
FOREIGN KEY (studentId)
REFERENCES db_examination.student (id);

ALTER TABLE db_examination.student_test
ADD CONSTRAINT
  fk_student_test_testId
FOREIGN KEY (testId)
REFERENCES db_examination.test (id);

-- SELECT ---------------------------------------------------------------

SELECT *
FROM db_examination.admin;

SELECT *
FROM db_examination.teacher;

SELECT *
FROM db_examination.assistant;

SELECT *
FROM db_examination.class;

SELECT *
FROM db_examination.student;

SELECT *
FROM db_examination.course;

SELECT *
FROM db_examination.paper;

SELECT *
FROM db_examination.test;

SELECT *
FROM db_examination.class_paper;

SELECT *
FROM db_examination.student_test;

TRUNCATE TABLE db_examination.student_test;

SELECT *
FROM db_examination.student_test st INNER JOIN db_examination.student s
  INNER JOIN db_examination.test t
  INNER JOIN db_examination.paper p
    ON st.studentId = s.id AND st.testId = t.id AND t.paperId = p.id
WHERE s.id = 1 AND p.id = 2;