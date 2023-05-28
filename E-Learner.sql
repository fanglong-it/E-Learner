-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- SWP391_Project_Test.dbo.Catery definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Catery;

CREATE TABLE SWP391_Project_Test.dbo.Catery (
	cateryId int IDENTITY(1,1) NOT NULL,
	cateryName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	value nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Catery PRIMARY KEY (cateryId)
);


-- SWP391_Project_Test.dbo.PricePackage definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.PricePackage;

CREATE TABLE SWP391_Project_Test.dbo.PricePackage (
	priceId int IDENTITY(1,1) NOT NULL,
	name nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	acessDuration int NULL,
	price float NULL,
	salePrice float NULL,
	status bit NULL,
	description nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_PricePackage PRIMARY KEY (priceId)
);


-- SWP391_Project_Test.dbo.[Role] definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.[Role];

CREATE TABLE SWP391_Project_Test.dbo.[Role] (
	roleId int IDENTITY(1,1) NOT NULL,
	roleName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Role PRIMARY KEY (roleId)
);


-- SWP391_Project_Test.dbo.[Type] definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.[Type];

CREATE TABLE SWP391_Project_Test.dbo.[Type] (
	typeId varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	typeName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Type PRIMARY KEY (typeId)
);


-- SWP391_Project_Test.dbo.Account definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Account;

CREATE TABLE SWP391_Project_Test.dbo.Account (
	userId int IDENTITY(1,1) NOT NULL,
	username nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	password nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	status bit NULL,
	email nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	phone nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fullname nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	address nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	gender bit NULL,
	avatar nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	roleId int NULL,
	created_date datetime DEFAULT getdate() NULL,
	modify_date datetime DEFAULT getdate() NULL,
	CONSTRAINT PK_Account PRIMARY KEY (userId),
	CONSTRAINT FK_Account_Role FOREIGN KEY (roleId) REFERENCES SWP391_Project_Test.dbo.[Role](roleId)
);


-- SWP391_Project_Test.dbo.Dimension definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Dimension;

CREATE TABLE SWP391_Project_Test.dbo.Dimension (
	dimId int IDENTITY(1,1) NOT NULL,
	typeId varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	name nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	description nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Dimension PRIMARY KEY (dimId),
	CONSTRAINT FK_Dimension_Type FOREIGN KEY (typeId) REFERENCES SWP391_Project_Test.dbo.[Type](typeId)
);


-- SWP391_Project_Test.dbo.Post_File definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Post_File;

CREATE TABLE SWP391_Project_Test.dbo.Post_File (
	id int IDENTITY(1,1) NOT NULL,
	name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	typeId varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	filePost varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__Post_Fil__3213E83FBA2FA08F PRIMARY KEY (id),
	CONSTRAINT FK_Post_File_Type FOREIGN KEY (typeId) REFERENCES SWP391_Project_Test.dbo.[Type](typeId)
);


-- SWP391_Project_Test.dbo.Setting definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Setting;

CREATE TABLE SWP391_Project_Test.dbo.Setting (
	settingId int NOT NULL,
	name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	description varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	value varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	typeId varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	status bit NULL,
	CONSTRAINT PK__Setting__097EE23C415BB797 PRIMARY KEY (settingId),
	CONSTRAINT FK_Setting_Type FOREIGN KEY (typeId) REFERENCES SWP391_Project_Test.dbo.[Type](typeId)
);


-- SWP391_Project_Test.dbo.Subject definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Subject;

CREATE TABLE SWP391_Project_Test.dbo.Subject (
	subjectId int IDENTITY(1,1) NOT NULL,
	subjectName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cateryId int NULL,
	status bit NULL,
	tagLine int NULL,
	title nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	thumbnail nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	description nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Subject PRIMARY KEY (subjectId),
	CONSTRAINT FK_Subject_Catery FOREIGN KEY (cateryId) REFERENCES SWP391_Project_Test.dbo.Catery(cateryId)
);


-- SWP391_Project_Test.dbo.SubjectDimension definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.SubjectDimension;

CREATE TABLE SWP391_Project_Test.dbo.SubjectDimension (
	subjectId int NOT NULL,
	dimId int NOT NULL,
	CONSTRAINT FK_SubjectDimension_Dimension FOREIGN KEY (dimId) REFERENCES SWP391_Project_Test.dbo.Dimension(dimId),
	CONSTRAINT FK_SubjectDimension_Subject FOREIGN KEY (subjectId) REFERENCES SWP391_Project_Test.dbo.Subject(subjectId)
);


-- SWP391_Project_Test.dbo.SubjectPrice definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.SubjectPrice;

CREATE TABLE SWP391_Project_Test.dbo.SubjectPrice (
	priceId int NULL,
	subjectId int NULL,
	CONSTRAINT FK_SubjectPrice_PricePackage FOREIGN KEY (priceId) REFERENCES SWP391_Project_Test.dbo.PricePackage(priceId),
	CONSTRAINT FK_SubjectPrice_Subject FOREIGN KEY (subjectId) REFERENCES SWP391_Project_Test.dbo.Subject(subjectId)
);


-- SWP391_Project_Test.dbo.Blog definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Blog;

CREATE TABLE SWP391_Project_Test.dbo.Blog (
	blogId int IDENTITY(1,1) NOT NULL,
	blogName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	subId int NULL,
	CONSTRAINT PK_Blog PRIMARY KEY (blogId),
	CONSTRAINT FK_Blog_Subject FOREIGN KEY (subId) REFERENCES SWP391_Project_Test.dbo.Subject(subjectId)
);


-- SWP391_Project_Test.dbo.Lesson definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Lesson;

CREATE TABLE SWP391_Project_Test.dbo.Lesson (
	lessonId int IDENTITY(1,1) NOT NULL,
	lessonName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	typeId varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[order] int NULL,
	video_url varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	content varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	topicId int NULL,
	status bit NULL,
	subId int NULL,
	description varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__Lesson__F88A97787B3BECE4 PRIMARY KEY (lessonId),
	CONSTRAINT FK_Lesson_Subject FOREIGN KEY (subId) REFERENCES SWP391_Project_Test.dbo.Subject(subjectId)
);


-- SWP391_Project_Test.dbo.Post definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Post;

CREATE TABLE SWP391_Project_Test.dbo.Post (
	postId int IDENTITY(1,1) NOT NULL,
	thumbnail varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	userId int NULL,
	cateryBlogId int NULL,
	content varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	created_date date DEFAULT getdate() NULL,
	edit_date date NULL,
	status bit NULL,
	brifInfor varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	title varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	postFileId int NULL,
	CONSTRAINT PK__Post__DD0C739A1B23EBA9 PRIMARY KEY (postId),
	CONSTRAINT FK_Post_Account FOREIGN KEY (userId) REFERENCES SWP391_Project_Test.dbo.Account(userId),
	CONSTRAINT FK_Post_Blog FOREIGN KEY (cateryBlogId) REFERENCES SWP391_Project_Test.dbo.Blog(blogId),
	CONSTRAINT FK_Post_Post_File FOREIGN KEY (postFileId) REFERENCES SWP391_Project_Test.dbo.Post_File(id)
);


-- SWP391_Project_Test.dbo.Registration_Subject definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Registration_Subject;

CREATE TABLE SWP391_Project_Test.dbo.Registration_Subject (
	regisId int IDENTITY(1,1) NOT NULL,
	regis_Date date DEFAULT getdate() NULL,
	statis varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	subId int NULL,
	priceId int NULL,
	userId int NULL,
	CONSTRAINT PK__Registra__61789DEFBEAB079A PRIMARY KEY (regisId),
	CONSTRAINT FK_Registration_Subject_Account FOREIGN KEY (userId) REFERENCES SWP391_Project_Test.dbo.Account(userId),
	CONSTRAINT FK_Registration_Subject_PricePackage FOREIGN KEY (priceId) REFERENCES SWP391_Project_Test.dbo.PricePackage(priceId),
	CONSTRAINT FK_Registration_Subject_Subject FOREIGN KEY (subId) REFERENCES SWP391_Project_Test.dbo.Subject(subjectId)
);


-- SWP391_Project_Test.dbo.Slider definition

-- Drop table

-- DROP TABLE SWP391_Project_Test.dbo.Slider;

CREATE TABLE SWP391_Project_Test.dbo.Slider (
	sliderId int IDENTITY(1,1) NOT NULL,
	slider_url varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	status bit NULL,
	title varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	content varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	backlink varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	notes varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	isShow bit NULL,
	subId int NULL,
	CONSTRAINT PK__Slider__14564CBED3A51B00 PRIMARY KEY (sliderId),
	CONSTRAINT FK_Slider_Subject FOREIGN KEY (subId) REFERENCES SWP391_Project_Test.dbo.Subject(subjectId)
);
