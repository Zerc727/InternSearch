drop table if exists sponsors;
create table sponsors (
	internship_id integer foreign key references internships(internship_id),
	sponsor_id integer primary key autoincrement,
	sponsor_name text not null,
	sponsor_companyname text not null,
	sponsor_email text not null,
	sponsor_internshiptitle text not null,
	sponsor_dateavail text not null,
	sponsor_special text not null,
	student_password varchar not null
);

drop table if exists interships;
create table internships (
	internship_id integer primary key autoincrement,
	sponsor_id integer foreign key references sponsors(sponsor_id),
	sponsor_internshiptitle text not null,
	sponsor_dateavail text not null,
	sponsor_special text not null
);

drop table if exists students;
create table students (
	student_id integer primary key,
	student_name text not null,
	student_email text not null,
	student_year text not null,
	student_majorminor text not null,
	student_gpa float not null,
	student_skillshobbies text not null,
	student_password varchar not null
);

drop table if exists applications;
create table applications (
	application_id integer autoincrement primary key,
	internship_id integer foreign key references internships(internship_id),
	student_id integer foreign key references students(student_id),
	date_avail integer not null
);

drop table if exists notifications;
create table notifications (
	internship_id integer foreign key references internships(internship_id),
	student_id integer foreign key references students(student_id),
	sender text not null,
	recipient text not null,
	description text not null,
	read_unread text not null
);

drop table if exists users;
create table faculty (
	faculty_id integer primary key autoincrement,
	faculty_name text not null,
	faculty_email text not null,
	faculty_password text not null
);
