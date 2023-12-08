-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-12-08 02:30:47.453

-- tables
-- Table: Application
CREATE TABLE Application (
    applicationID varchar  NOT NULL,
    applicationStatus text  NOT NULL,
    jobID varchar  NOT NULL,
    CONSTRAINT Application_pk PRIMARY KEY (applicationID)
);

-- Table: Company
CREATE TABLE Company (
    companyID int  NOT NULL,
    companyName text  NOT NULL,
    size text  NOT NULL,
    location text  NOT NULL,
    premium boolean  NOT NULL,
    CONSTRAINT Company_pk PRIMARY KEY (companyID)
);

-- Table: Connection
CREATE TABLE Connection (
    uID_1 int  NOT NULL,
    uID_2 int  NOT NULL,
    CONSTRAINT Connection_pk PRIMARY KEY (uID_1,uID_2)
);

-- Table: Job_Post
CREATE TABLE Job_Post (
    jobID varchar  NOT NULL,
    name text  NOT NULL,
    "level" text  NOT NULL,
    salary text  NOT NULL,
    location text  NOT NULL,
    requirement text  NOT NULL,
    description text  NOT NULL,
    companyID int  NOT NULL,
    CONSTRAINT Job_Post_pk PRIMARY KEY (jobID)
);

-- Table: Job_Seeker
CREATE TABLE Job_Seeker (
    jobSeekerID int  NOT NULL,
    searchingJobTitle text  NOT NULL,
    CONSTRAINT Job_Seeker_pk PRIMARY KEY (jobSeekerID)
);

-- Table: Message
CREATE TABLE Message (
    messageID int  NOT NULL,
    msg text  NOT NULL,
    uID int  NOT NULL,
    CONSTRAINT Message_pk PRIMARY KEY (messageID)
);

-- Table: Notification
CREATE TABLE Notification (
    notificationID int  NOT NULL,
    message text  NOT NULL,
    jobID varchar  NOT NULL,
    CONSTRAINT Notification_pk PRIMARY KEY (notificationID)
);

-- Table: Notified
CREATE TABLE Notified (
    jobSeekerID int  NOT NULL,
    notificationID int  NOT NULL,
    CONSTRAINT Notified_pk PRIMARY KEY (jobSeekerID)
);

-- Table: ReceivedMessage
CREATE TABLE ReceivedMessage (
    msg text  NOT NULL,
    uID int  NOT NULL,
    messageID int  NOT NULL,
    CONSTRAINT ReceivedMessage_pk PRIMARY KEY (messageID,uID)
);

-- Table: Recruiter
CREATE TABLE Recruiter (
    recruiterID int  NOT NULL,
    recruitingStatus text  NOT NULL,
    companyID int  NOT NULL,
    CONSTRAINT Recruiter_pk PRIMARY KEY (recruiterID)
);

-- Table: Saved_Job
CREATE TABLE Saved_Job (
    jobSeekerID int  NOT NULL,
    jobID varchar  NOT NULL,
    CONSTRAINT Saved_Job_pk PRIMARY KEY (jobSeekerID,jobID)
);

-- Table: Submission
CREATE TABLE Submission (
    submissionDate date  NOT NULL,
    resumePath text  NOT NULL,
    jobSeekerID int  NOT NULL,
    applicationID varchar  NOT NULL,
    CONSTRAINT Submission_pk PRIMARY KEY (jobSeekerID,applicationID)
);

-- Table: User
CREATE TABLE "User" (
    uID int  NOT NULL,
    username text  NOT NULL,
    currentTitle text  NOT NULL,
    education text  NOT NULL,
    premium boolean  NOT NULL,
    experience text  NOT NULL,
    skill text  NOT NULL,
    language text  NOT NULL,
    honorsAndAwards text  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (uID)
);

-- foreign keys
-- Reference: Application_Job_Post (table: Application)
ALTER TABLE Application ADD CONSTRAINT Application_Job_Post
    FOREIGN KEY (jobID)
    REFERENCES Job_Post (jobID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Connection_User1 (table: Connection)
ALTER TABLE Connection ADD CONSTRAINT Connection_User1
    FOREIGN KEY (uID_2)
    REFERENCES "User" (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Connection_User2 (table: Connection)
ALTER TABLE Connection ADD CONSTRAINT Connection_User2
    FOREIGN KEY (uID_1)
    REFERENCES "User" (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Job_Post_Company (table: Job_Post)
ALTER TABLE Job_Post ADD CONSTRAINT Job_Post_Company
    FOREIGN KEY (companyID)
    REFERENCES Company (companyID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Job_Seeker_User (table: Job_Seeker)
ALTER TABLE Job_Seeker ADD CONSTRAINT Job_Seeker_User
    FOREIGN KEY (jobSeekerID)
    REFERENCES "User" (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Message_User (table: Message)
ALTER TABLE Message ADD CONSTRAINT Message_User
    FOREIGN KEY (uID)
    REFERENCES "User" (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Notification_Job_Post (table: Notification)
ALTER TABLE Notification ADD CONSTRAINT Notification_Job_Post
    FOREIGN KEY (jobID)
    REFERENCES Job_Post (jobID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Notified_Job_Seeker (table: Notified)
ALTER TABLE Notified ADD CONSTRAINT Notified_Job_Seeker
    FOREIGN KEY (jobSeekerID)
    REFERENCES Job_Seeker (jobSeekerID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Notified_Notification (table: Notified)
ALTER TABLE Notified ADD CONSTRAINT Notified_Notification
    FOREIGN KEY (notificationID)
    REFERENCES Notification (notificationID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ReceivedMessage_Message (table: ReceivedMessage)
ALTER TABLE ReceivedMessage ADD CONSTRAINT ReceivedMessage_Message
    FOREIGN KEY (messageID)
    REFERENCES Message (messageID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ReceivedMessage_User (table: ReceivedMessage)
ALTER TABLE ReceivedMessage ADD CONSTRAINT ReceivedMessage_User
    FOREIGN KEY (uID)
    REFERENCES "User" (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recruiter_Company (table: Recruiter)
ALTER TABLE Recruiter ADD CONSTRAINT Recruiter_Company
    FOREIGN KEY (companyID)
    REFERENCES Company (companyID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recruiter_User (table: Recruiter)
ALTER TABLE Recruiter ADD CONSTRAINT Recruiter_User
    FOREIGN KEY (recruiterID)
    REFERENCES "User" (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Saved_Job_Job_Post (table: Saved_Job)
ALTER TABLE Saved_Job ADD CONSTRAINT Saved_Job_Job_Post
    FOREIGN KEY (jobID)
    REFERENCES Job_Post (jobID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Saved_Job_Job_Seeker (table: Saved_Job)
ALTER TABLE Saved_Job ADD CONSTRAINT Saved_Job_Job_Seeker
    FOREIGN KEY (jobSeekerID)
    REFERENCES Job_Seeker (jobSeekerID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Submission_Application (table: Submission)
ALTER TABLE Submission ADD CONSTRAINT Submission_Application
    FOREIGN KEY (applicationID)
    REFERENCES Application (applicationID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Submission_Job_Seeker (table: Submission)
ALTER TABLE Submission ADD CONSTRAINT Submission_Job_Seeker
    FOREIGN KEY (jobSeekerID)
    REFERENCES Job_Seeker (jobSeekerID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

