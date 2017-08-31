insert into tb_student (studentID,password,studentName,studentImage,preferences,department,phonenumber) values ('123456a','49ba59abb','小明',null,'大数据','研发部','18888888888');
insert into tb_student (studentID,password,studentName,studentImage,preferences,department,phonenumber) values ('123456b','49ba59abb','小红',null,'大数据','研发部','18888888888');
insert into tb_student (studentID,password,studentName,studentImage,preferences,department,phonenumber) values ('123456c','49ba59abb','小蝈蝈',null,'大数据','研发部','18888888888');
insert into tb_student (studentID,password,studentName,studentImage,preferences,department,phonenumber) values ('123456d','49ba59abb','小蚂蚱',null,'大数据','研发部','18888888888');
insert into tb_manager (managerID,password,managerName,managerImage) values ('394655817@qq.com','49ba59abb','汤松岩',null);
insert into tb_teacher(teacherID,password,teacherName,teacherImage,department,phonenumber) values('123','49ba59abb','李老师',null,'深圳大学','18888888888');
insert into tb_teacher(teacherID,password,teacherName,teacherImage,department,phonenumber) values('2123','49ba59abb','李老师',null,'深圳大学','18888888888');
insert into tb_teacher(teacherID,password,teacherName,teacherImage,department,phonenumber) values('3123','49ba59abb','张老师',null,'深圳大学','18888888888');
insert into tb_data(dataName,dataImage,dataPath,dataAbstract,dataType) 
values('深度学习教程1',null,'D:\\新建文件夹 (2)\\深度学习教程1.txt',null,'书籍');
insert into tb_data(dataName,dataImage,dataPath,dataAbstract,dataType) 
values('深度学习教程2',null,'D:\\新建文件夹 (2)\\深度学习教程2.txt',null,'书籍');
insert into tb_data(dataName,dataImage,dataPath,dataAbstract,dataType) 
values('深度学习教程3',null,'D:\\新建文件夹 (2)\\深度学习教程3.txt',null,'书籍');
insert into tb_course (courseTeacher,courseName,plan,schedule,courseInfo,itemBank)
		values('123','hadoop应用',null,0.5,null,null);
insert into tb_course (courseTeacher,courseName,plan,schedule,courseInfo,itemBank)
		values('123','R语言应用',null,0.3,null,null);
insert into tb_course (courseTeacher,courseName,plan,schedule,courseInfo,itemBank)
		values('123','大数据应用',null,0.4,null,null);
insert into tb_course (courseTeacher,courseName,plan,schedule,courseInfo,itemBank)
		values('2123','大数据应用',null,0.4,null,null);
insert into tb_course (courseTeacher,courseName,plan,schedule,courseInfo,itemBank)
		values('3123','人工智能',null,0.4,null,null);