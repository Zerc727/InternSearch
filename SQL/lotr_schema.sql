drop table if exists sponsor;
create table sponsor (
	internship_id integer primary key autoincrement,
	sponsor_id integer not null,
	sponsor_name text not null,
	sponsor_companyname text not null,
	sponsor_email text not null,
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
	student_skillshobbies text not null
);

drop table if exists applications;
create table applications (
	internship_id integer foreign key,
	student_id integer foreign key,
	sponsor_companyname text foreign key not null,
	sponsor_internshiptitle text foreign key not null,
	date_avail integer not null,
);

drop table if exists notifications;
create table notifications (
	internship_id integer foreign key,
	student_id integer foreign key,
	sender text not null,
	recipient text not null,
	description text not null,
	read_unread text not null,
);

