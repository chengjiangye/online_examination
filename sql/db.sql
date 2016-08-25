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

INSERT INTO db_examination.admin VALUE (NULL, 'admin@tsinghua.edu.cn', '系统管理员', 'Qckl0fvVHs9Id4rFngOFG+WBTJyrNwW5yxmshz5BpBoDFSMNC6Dxohh+7kZfTmit'); -- password: 123

SELECT *
FROM db_examination.admin;