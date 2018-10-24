SET foreign_key_checks = 0;
drop table if exists sponsors;
create table sponsors (
	sponsor_id integer primary key auto_increment,
	sponsor_name varchar(255) not null,
	sponsor_companyname varchar(255) not null,
	sponsor_email varchar(255) not null,
	sponsor_internshiptitle varchar(255) not null,
	sponsor_dateavail varchar(255) not null,
	sponsor_special varchar(255) not null,
	student_password varchar(255) not null
);

drop table if exists interships;
create table internships (
	internship_id integer primary key auto_increment,
	sponsor_internshiptitle varchar(255) not null,
	sponsor_dateavail varchar(255) not null,
	sponsor_special varchar(255) not null
);

ALTER TABLE internships ADD sponsor_id integer;
ALTER TABLE internships ADD FOREIGN KEY (sponsor_id) references sponsors(sponsor_id);
ALTER TABLE sponsors ADD internship_id integer;
ALTER TABLE sponsors ADD FOREIGN KEY (internship_id) references internships(internship_id);

drop table if exists students;
create table students (
	student_id integer primary key auto_increment,
	student_name varchar(255) not null,
	student_email varchar(255) not null,
	student_year varchar(255) not null,
	student_majorminor varchar(255) not null,
	student_gpa float not null,
	student_skillshobbies varchar(255) not null,
	student_password varchar(255) not null
);

drop table if exists applications;
create table applications (
	application_id integer auto_increment primary key,
	date_avail integer not null
);

ALTER TABLE applications ADD internship_id integer;
ALTER TABLE applications ADD FOREIGN KEY (internship_id) references internships(internship_id);
ALTER TABLE applications ADD student_id integer;
ALTER TABLE applications ADD FOREIGN KEY (student_id) references students(student_id);

drop table if exists notifications;
create table notifications (
	notification_id integer primary key auto_increment,
	sender varchar(255) not null,
	recipient varchar(255) not null,
	description varchar(255) not null,
	read_unread varchar(255) not null
);

drop table if exists faculty;
create table faculty (
	faculty_id integer primary key auto_increment,
	faculty_name varchar(255) not null,
	faculty_email varchar(255) not null,
	faculty_password varchar(255) not null
);
SET foreign_key_checks = 1;
