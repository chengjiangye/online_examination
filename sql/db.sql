DROP DATABASE IF EXISTS db_examination;
CREATE DATABASE db_examination;

-- table admin
DROP TABLE IF EXISTS db_examination.admin;
CREATE TABLE db_examination.admin (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(255) NOT NULL UNIQUE
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
  email    VARCHAR(255) NOT NULL UNIQUE
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
  email    VARCHAR(255) NOT NULL UNIQUE
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


SELECT *
FROM db_examination.admin;

SELECT *
FROM db_examination.teacher;

SELECT *
FROM db_examination.assistant;

SELECT *
FROM db_examination.class;