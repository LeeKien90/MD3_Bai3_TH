create table class(
classid int primary key auto_increment,
classname varchar(30) not null,
Startdate date not null,
status bit not null
);

create table student(
studentid int primary key auto_increment,
studentname varchar(30) not null,
address varchar(50) not null,
phone varchar(30) not null unique,
status bit,
classid int,
foreign key(classid) references class(classid)
);

create table subjects(
subid int primary key auto_increment,
subname varchar(30) not null,
credit int not null,
status bit not null
);

create table mark(
markid int,
subid int not null,
studentid int not null,
mark varchar(5) not null,
examtimes int not null,
foreign key(subid) references subjects(subid),
foreign key (studentid) references student(studentid),
primary key(subid,studentid)
);

insert into Class
values (1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong',093256476, 1, 1),
('Manh', 'HCM', '0123123123', 0, 2); 

INSERT INTO Subjects
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 insert INTO Mark (SubId, StudentId, Mark, ExamTimes) 
 VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 -- Sử dụng câu lệnh Select * và lấy dữ liệu học viên từ bảng Student để hiển thị danh sách tất cả các học viên
 select *
 from student;
 
 -- Để hiển thị danh sách học viên đang theo học cần phải sử dụng câu lệnh select ... from kèm theo where để xét điều kiện truy vấn 
 select *
 from student s
 where s.status = true;
 
 -- Sử dụng điều kiện where Credit < 10 và from Subject để lấy ra danh sách các môn học có thời gian học nhỏ hơn 10
 select *
 from subjects s
 where s.credit < 10;
 
 --  Sử dụng câu lệnh Join và where để hiển thị danh sách học viên lớp A1
 select s.studentid, s.studentname, c.classname
 from student s join class c on s.classid = c.classid
 where c.classname = 'a1';
 
 -- Hiển thị điểm môn CF của các học viên
 select s.studentid,s.studentname,sub.subname,m.mark
 from student s join mark m on s.studentid = m.studentid join subjects sub on m.subid = sub.subid
 where sub.subname = 'cf';