
--DROP SCHEMA dbo;

--CREATE SCHEMA dbo;

-- [e-learner].dbo.Course definition

-- Drop table

-- DROP TABLE [e-learner].dbo.Course;

CREATE TABLE [e-learner].dbo.Course (
	id int IDENTITY(1,1) NOT NULL,
	courseName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	status bit NULL,
	[image] nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	description nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	createDate date NULL,
	CONSTRAINT PK__Course__3213E83F4B6C639B PRIMARY KEY (id)
);


-- [e-learner].dbo.[Role] definition

-- Drop table

-- DROP TABLE [e-learner].dbo.[Role];

CREATE TABLE [e-learner].dbo.[Role] (
	roleId int NOT NULL,
	roleName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__Role__CD98462A6B065A89 PRIMARY KEY (roleId)
);


-- [e-learner].dbo.Account definition

-- Drop table

-- DROP TABLE [e-learner].dbo.Account;

CREATE TABLE [e-learner].dbo.Account (
	id int IDENTITY(1,1) NOT NULL,
	username nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	password nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	status bit NULL,
	email nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	phone nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fullname nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	address nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	avatar nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	roleId int NULL,
	CONSTRAINT PK__Account__3213E83F3BEF53B1 PRIMARY KEY (id),
	CONSTRAINT FK__Account__roleId__38996AB5 FOREIGN KEY (roleId) REFERENCES [e-learner].dbo.[Role](roleId)
);


-- [e-learner].dbo.Class definition

-- Drop table

-- DROP TABLE [e-learner].dbo.Class;

CREATE TABLE [e-learner].dbo.Class (
	id int IDENTITY(1,1) NOT NULL,
	className nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	maxStudent int NULL,
	userId int NULL,
	dateCreate date NULL,
	[image] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	status bit NULL,
	courseId int NULL,
	CONSTRAINT PK__Class__3213E83FEE514B06 PRIMARY KEY (id),
	CONSTRAINT FK_COURSE_ID FOREIGN KEY (courseId) REFERENCES [e-learner].dbo.Course(id)
);


-- [e-learner].dbo.FeedBack definition

-- Drop table

-- DROP TABLE [e-learner].dbo.FeedBack;

CREATE TABLE [e-learner].dbo.FeedBack (
	id int IDENTITY(1,1) NOT NULL,
	[start] int NULL,
	content nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date] date NULL,
	userId int NULL,
	CONSTRAINT PK__FeedBack__3213E83F3F86C017 PRIMARY KEY (id),
	CONSTRAINT FK__FeedBack__userId__3B75D760 FOREIGN KEY (userId) REFERENCES [e-learner].dbo.Account(id)
);


-- [e-learner].dbo.GroupChat definition

-- Drop table

-- DROP TABLE [e-learner].dbo.GroupChat;

CREATE TABLE [e-learner].dbo.GroupChat (
	id int IDENTITY(1,1) NOT NULL,
	groupChatName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	isPrivate bit NULL,
	classId int NULL,
	userId int NULL,
	CONSTRAINT PK__GroupCha__3213E83FDBD43DC8 PRIMARY KEY (id),
	CONSTRAINT FK__GroupChat__class__4AB81AF0 FOREIGN KEY (classId) REFERENCES [e-learner].dbo.Class(id),
);


-- [e-learner].dbo.Lesson definition

-- Drop table

-- DROP TABLE [e-learner].dbo.Lesson;

CREATE TABLE [e-learner].dbo.Lesson (
	id int IDENTITY(1,1) NOT NULL,
	lessonName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	status bit NULL,
	description nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	videoUrl nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	courseId int NULL,
	CONSTRAINT PK__Lesson__3213E83F3CCBADA7 PRIMARY KEY (id),
	CONSTRAINT FK__Lesson__courseId__4222D4EF FOREIGN KEY (courseId) REFERENCES [e-learner].dbo.Course(id)
);


-- [e-learner].dbo.[Member] definition

-- Drop table

-- DROP TABLE [e-learner].dbo.[Member];

CREATE TABLE [e-learner].dbo.[Member] (
	id int IDENTITY(1,1) NOT NULL,
	groupChatId int NULL,
	userId int NULL,
	isLeader int NULL,
	CONSTRAINT PK__Member__3213E83FDBD43DC8 PRIMARY KEY (id),
	CONSTRAINT FK__Member__groupCha__2CF2ADDF FOREIGN KEY (groupChatId) REFERENCES [e-learner].dbo.GroupChat(id),
	CONSTRAINT FK__Member__userId__2DE6D218 FOREIGN KEY (userId) REFERENCES [e-learner].dbo.Account(id)
);

-- [e-learner].dbo.Message definition

-- Drop table

-- DROP TABLE [e-learner].dbo.Message;

CREATE TABLE [e-learner].dbo.Message (
	id int IDENTITY(1,1) NOT NULL,
	content nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	resoucePathFile nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	userId int NULL,
	groupId int NULL,
	dateSended datetime NULL,
	CONSTRAINT PK__Message__3213E83F99F8FAF6 PRIMARY KEY (id),
	CONSTRAINT FK__Message__groupId__4F7CD00D FOREIGN KEY (groupId) REFERENCES [e-learner].dbo.GroupChat(id),
	CONSTRAINT FK__Message__userId__4E88ABD4 FOREIGN KEY (userId) REFERENCES [e-learner].dbo.Account(id)
);


-- [e-learner].dbo.RegistrationClass definition

-- Drop table

-- DROP TABLE [e-learner].dbo.RegistrationClass;

CREATE TABLE [e-learner].dbo.RegistrationClass (
	id int IDENTITY(1,1) NOT NULL,
	requestDate date NULL,
	requestStatus varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	classId int NULL,
	accountId int NULL,
	CONSTRAINT PK__Registra__3213E83F19FF774F PRIMARY KEY (id),
	CONSTRAINT FK__Registrat__accou__47DBAE45 FOREIGN KEY (accountId) REFERENCES [e-learner].dbo.Account(id),
	CONSTRAINT FK__Registrat__class__46E78A0C FOREIGN KEY (classId) REFERENCES [e-learner].dbo.Class(id)
);


-- [e-learner].dbo.Resource definition

-- Drop table

-- DROP TABLE [e-learner].dbo.Resource;

CREATE TABLE [e-learner].dbo.Resource (
	id int IDENTITY(1,1) NOT NULL,
	resourceName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	description nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	resourcePath nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	lessonId int NULL,
	CONSTRAINT PK__Resource__3213E83FF61910C0 PRIMARY KEY (id),
	CONSTRAINT Resource_FK FOREIGN KEY (lessonId) REFERENCES [e-learner].dbo.Lesson(id)
);


-- [e-learner].dbo.[Role]
INSERT INTO [e-learner].dbo.[Role] (roleId, roleName)
VALUES (1, 'ADMIN');

INSERT INTO [e-learner].dbo.[Role] (roleId, roleName)
VALUES (2, 'TEACHER');

INSERT INTO [e-learner].dbo.[Role] (roleId, roleName)
VALUES (3, 'STUDENT');

INSERT INTO [e-learner].dbo.[Role] (roleId, roleName)
VALUES (4, 'CUSTOMER');

-- [e-learner].dbo.Account
INSERT INTO [e-learner].dbo.Account (username, password, status, email, phone, fullname, address, avatar, roleId)
VALUES ('admin', 'admin', 1, 'user1@example.com', '123456789', 'User 1', 'Address 1', 'avatar1.jpg', 1);

INSERT INTO [e-learner].dbo.Account (username, password, status, email, phone, fullname, address, avatar, roleId)
VALUES ('teacher', 'teacher', 1, 'admin@example.com', '987654321', 'Administrator', 'Admin Address', 'adminavatar.jpg', 2);

INSERT INTO [e-learner].dbo.Account (username, password, status, email, phone, fullname, address, avatar, roleId)
VALUES ('student', 'student', 1, 'user1@example.com', '123456789', 'User 1', 'Address 1', 'avatar1.jpg', 3);

INSERT INTO [e-learner].dbo.Account (username, password, status, email, phone, fullname, address, avatar, roleId)
VALUES ('customer', 'customer', 1, 'user1@example.com', '123456789', 'User 1', 'Address 1', 'avatar1.jpg', 4);


-- [e-learner].dbo.Course
INSERT INTO [e-learner].dbo.Course (courseName, status, [image], description, createDate)
VALUES ('Course 1', 1, 'image1.jpg', 'Description for Course 1', '2023-01-01');

INSERT INTO [e-learner].dbo.Course (courseName, status, [image], description, createDate)
VALUES ('Course 2', 1, 'image2.jpg', 'Description for Course 2', '2023-02-01');

INSERT INTO [e-learner].dbo.Course (courseName, status, [image], description, createDate)
VALUES ('Course 3', 1, 'image2.jpg', 'Description for Course 2', '2023-02-01');

INSERT INTO [e-learner].dbo.Course (courseName, status, [image], description, createDate)
VALUES ('Course 4', 1, 'image2.jpg', 'Description for Course 2', '2023-02-01');

INSERT INTO [e-learner].dbo.Course (courseName, status, [image], description, createDate)
VALUES ('Course 5', 0, 'image2.jpg', 'Description for Course 2', '2023-02-01');


-- [e-learner].dbo.Class
INSERT INTO [e-learner].dbo.Class (className, maxStudent, userId, dateCreate, [image], status, courseId)
VALUES ('Class 1', 30, 2, '2023-03-01', 'classimage1.jpg', 1, 1);

-- [e-learner].dbo.Class
INSERT INTO [e-learner].dbo.Class (className, maxStudent, userId, dateCreate, [image], status, courseId)
VALUES ('Class 2', 30, 2, '2023-03-01', 'classimage1.jpg', 1, 1);


INSERT INTO [e-learner].dbo.Class (className, maxStudent, userId, dateCreate, [image], status, courseId)
VALUES ('Class 2', 20, 2, '2023-04-01', 'classimage2.jpg', 1, 2);

INSERT INTO [e-learner].dbo.Class (className, maxStudent, userId, dateCreate, [image], status, courseId)
VALUES ('Class 3', 20, 2, '2023-04-01', 'classimage2.jpg', 1, 3);

INSERT INTO [e-learner].dbo.Class (className, maxStudent, userId, dateCreate, [image], status, courseId)
VALUES ('Class 4', 20, 2, '2023-04-01', 'classimage2.jpg', 1, 4);

INSERT INTO [e-learner].dbo.Class (className, maxStudent, userId, dateCreate, [image], status, courseId)
VALUES ('Class 5', 20, 2, '2023-04-01', 'classimage2.jpg', 1, 5);

-- [e-learner].dbo.FeedBack
INSERT INTO [e-learner].dbo.FeedBack ([start], content, [date], userId)
VALUES (5, 'Feedback content 1', '2023-03-15', 2);

INSERT INTO [e-learner].dbo.FeedBack ([start], content, [date], userId)
VALUES (4, 'Feedback content 2', '2023-04-15', 2);



-- [e-learner].dbo.Lesson
INSERT INTO [e-learner].dbo.Lesson (lessonName, status, description, videoUrl, courseId)
VALUES ('Lesson 1', 1, 'Description for Lesson 1', 'JRxvZuwMWTk', 1);
INSERT INTO [e-learner].dbo.Lesson (lessonName, status, description, videoUrl, courseId)
VALUES ('Lesson 2', 1, 'Description for Lesson 2', 'ljEwjChjCqA', 1);
INSERT INTO [e-learner].dbo.Lesson (lessonName, status, description, videoUrl, courseId)
VALUES ('Lesson 3', 1, 'Description for Lesson 3', 'yWv56h9oxG0', 1);
INSERT INTO [e-learner].dbo.Lesson (lessonName, status, description, videoUrl, courseId)
VALUES ('Lesson 4', 1, 'Description for Lesson 4', 'eY6U31dyuUs', 1);

INSERT INTO [e-learner].dbo.Lesson (lessonName, status, description, videoUrl, courseId)
VALUES ('Lesson 1', 1, 'Description for Lesson 1', 'D4o_8BhsK8s', 2);

INSERT INTO [e-learner].dbo.Lesson (lessonName, status, description, videoUrl, courseId)
VALUES ('Lesson 1', 1, 'Description for Lesson 1', 'wsNPdGi6ZlQ', 3);

INSERT INTO [e-learner].dbo.Lesson (lessonName, status, description, videoUrl, courseId)
VALUES ('Lesson 1', 1, 'Description for Lesson 1', 'MRZmg2-Egpw', 4);



-- [e-learner].dbo.GroupChat
INSERT INTO [e-learner].dbo.GroupChat (groupChatName, isPrivate, classId)
VALUES ('Group Chat 1', 0, 1);

INSERT INTO [e-learner].dbo.GroupChat (groupChatName, isPrivate, classId)
VALUES ('Group Chat 2', 1, 2);



-- [e-learner].dbo.Message
INSERT INTO [e-learner].dbo.Message (content, resoucePathFile, userId, groupId)
VALUES ('Message content 1', '', 1, 1);

INSERT INTO [e-learner].dbo.Message (content, resoucePathFile, userId, groupId)
VALUES ('Message content 2', 'path/to/file2', 2, 2);

-- [e-learner].dbo.RegistrationClass
INSERT INTO [e-learner].dbo.RegistrationClass (requestDate, requestStatus, classId, accountId)
VALUES ('2023-03-10', 'Pending', 1, 3);

INSERT INTO [e-learner].dbo.RegistrationClass (requestDate, requestStatus, classId, accountId)
VALUES ('2023-04-10', 'Approved', 2, 3);