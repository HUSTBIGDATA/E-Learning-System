drop database if exists elearningdb;
create database elearningdb default charset utf8;
use elearningdb;

## 创建学员表
create table tb_student (
	ID				integer auto_increment primary key,
	studentID 		varchar(30),
	password 		varchar(30),
    studentName 	varchar(10),
    studentImage 	varchar(255),
    preferences 	varchar(100),
    department		varchar(30),
    phonenumber		varchar(20),
    unique(studentID)
)engine = InnoDB;


## 创建教师表
create table tb_teacher (
	ID				integer auto_increment primary key,
	teacherID 		varchar(30),
    password 		varchar(30),
    teacherName 	varchar(10),
    teacherImage 	varchar(255),
	department		varchar(30),
    phonenumber		varchar(20),
    unique(teacherID)
)engine = InnoDB;

## 创建领导人员及管理人员表
create table tb_manager (
	ID				integer auto_increment primary key,
	managerID 		varchar(30),
    password 		varchar(30),
    managerName 	varchar(10),
    managerImage 	varchar(255),
    unique(managerID)
)engine = InnoDB;

##创建课程信息表
create table tb_course (
	courseID 		integer auto_increment primary key,
    courseName		varchar(50),
    courseTeacher	varchar(30),
    plan 			varchar(255),
    schedule 		float,
    courseInfo 		varchar(255),
    itemBank 		varchar(255),
    
    foreign key (courseTeacher) references tb_teacher(teacherID)   
)engine = InnoDB;

##创建选课信息表
create table tb_selection (
	selectionID 	integer auto_increment primary key,
    courseID 		integer,
    courseStudent 	varchar(30),
    isPassed 		boolean,
    
    foreign key (courseID) references tb_course(courseID),
    foreign key (courseStudent) references tb_student(studentID)
)engine = InnoDB;

##创建帖子信息表
create table tb_post (
	postID 			integer auto_increment primary key,
    postName 		varchar(100),
    postContent 	varchar(255),
    postViews 		integer,
    postDate 		datetime,
    postWeight 		integer,
    liked 			integer,
    marked			integer,
    isStared 		boolean
)engine = InnoDB;

##创建帖子访问日志
create table tb_postlog (
	postlogID 		integer auto_increment primary key,
    postID 			integer,
    isLiked 		boolean,
    isMarked 		boolean,
    visitorID 		varchar(30),
    visitTime 		datetime,
    
    foreign key (postID) references tb_post(postID)
)engine = InnoDB;

##创建资料信息表
create table tb_data (
	dataID 			integer auto_increment primary key,
    dataName 		varchar(30),
    dataImage 		varchar(255),
    dataPath 		varchar(255),
    dataAbstract 	varchar(255),
    dataType		varchar(20),
    dataDownloadSum integer
)engine = InnoDB;

##创建资料访问日志
create table tb_datalog (
	datalogID 		integer auto_increment primary key,
    dataID 			integer,
    downloaderID 	varchar(30),
    downloadTime 	datetime,
    
    foreign key (dataID) references tb_data(dataID)
)engine = InnoDB;

##创建新闻信息表
create table tb_news (
	newsID 			integer auto_increment primary key,
    newsTitle 		varchar(100),
    newsImage 		varchar(255),
    newsAbstract 	varchar(255),
    newsPath 		varchar(255),
    newsVisitSum 	integer,
    newsTags 		varchar(255),
    liked			integer,
    marked 			integer,
    isStared 		boolean,
    newsDate 		datetime,
    newsWeight 		integer
)engine = InnoDB;

##创建新闻浏览日志
create table tb_newslog (
	newslogID 		integer auto_increment primary key,
    newsID 			integer,
    isLiked 		boolean,
    isMarked 		boolean,
    visitorID 		varchar(30),
    visitTime 		datetime,
    
    foreign key (newsID) references tb_news(newsID)
)engine = InnoDB;


















