CREATE DATABASE QuanLiHocVien;
USE QuanLiHocVien;
CREATE TABLE Class(
ClassId int auto_increment primary key,
ClassName varchar(50)
);
CREATE TABLE Student(
StudentId int auto_increment primary key,
StudentName nvarchar(50) not null,
Age int,
Address nvarchar(50),
ClassId int,
foreign key(ClassId) references Class(ClassId)
);
insert into Class(ClassName) values
('JAVA062022'),
('JS072022'),
('JS082022'),
('JS092022')
;
insert into student(StudentName,Age,Address,ClassId) values 
('Trần Tiến Đạt',22,'Hải Phòng',1),
('Tạ Hồng Phú',24,'Hà Nội',2),
('Phạm Hoàng Hà',20,'Hà Nội',3),
('Đào Duy Tùng',30,'Thái Bình',4),
('Trần Văn Ba',26,'Vĩnh Phúc',1)
;
-- Lấy tất cả thông tin sinh viên
select s.StudentId,s.StudentName,s.Age,s.Address,s.classId
from student s;
-- Lấy thông tin sinh viên bao gồm mã sinh viên, tên sinh viên, tuổi và lớp 
select s.StudentId,s.StudentName,s.Age,s.classId
from student s;
-- Lấy tên các lớp mà có sinh viên
select distinct s.ClassId,s.ClassName
from Class s join Student c on s.ClassId = c.ClassId;
-- In ra số tuổi cao nhất, thấp nhất, tuổi trung bình, tổng tuổi của sinh viên
select max(s.Age),min(s.Age),avg(s.Age),sum(s.Age)
from student s;
-- lấy thông tin mã sinh viên, tên sinh viên
select s.StudentId,s.StudentName
from student s;
-- lấy thông tin sinh viên có tuổi lớn hơn 20
select *
from Student s
where Age > 20;

-- Lấy thông tin sinh viên có tuổi lớn hơn 20 địa chỉ ở hà nội
select s.StudentId, s.StudentName, s.Age, s.Address, s.ClassId
from Student s
where Age > 20 and Address = 'Hà Nội' ;
-- Lấy thông tin sinh viên có tuổi nằm trong khoảng 18 -22 
select s.StudentId, s.StudentName, s.Age, s.Address, s.ClassId
from Student s
where Age between 18 and 22;
-- Lấy thông tin sinh viên có tuổi 20,22 hoặc 26
select s.StudentId, s.StudentName, s.Age, s.Address, s.ClassId
from Student s
where Age in (20,22,26);
-- Lấy thông tin sinh viên bắt đầu bằng kí tự T
select s.StudentId, s.StudentName, s.Age, s.Address, s.ClassId
from Student s
where StudentName like 'T%';
-- Lấy thông tin sinh viên có kí tự thứ 2 là r
select s.StudentId, s.StudentName, s.Age, s.Address, s.ClassId
from Student s
where StudentName like '_r%';
-- lấy thông tin sinh viên có kí tự n
select s.StudentId, s.StudentName, s.Age, s.Address, s.ClassId
from Student s
where StudentName like '%n%';
-- Tính số tuổi trung bình của sinh viên trong các lớp
select s.classId,avg(c.Age)
from Class s join Student c on s.ClassId = c.ClassId
group by c.classId;
-- lấy tất  cả các lớp có tuổi trung bình lớn hơn 21
select s.classId,avg(c.Age)
from Class s join Student c on s.ClassId = c.ClassId
group by c.classId
having avg(c.Age) > 21;
-- lấy thông tin sinh viên có tuổi giảm dần, tên tăng dần
select s.StudentId, s.StudentName, s.Age, s.Address, s.ClassId
from Student s
order by Age desc, StudentName asc;
-- lấy ra thông tin 3 sinh viên 
select s.StudentId, s.StudentName, s.Age, s.Address, s.ClassId
from Student s
limit 3;