-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-12-08 03:51:50.533

-- tables
-- Table: Applications
DROP TABLE IF EXISTS Applications CASCADE;
CREATE TABLE Applications (
    applicationID varchar  NOT NULL,
    applicationStatus text  NOT NULL,
    jobID VARCHAR  NOT NULL,
    CONSTRAINT Applications_pk PRIMARY KEY (applicationID)
);

-- Table: Companies
DROP TABLE IF EXISTS Companies CASCADE;
CREATE TABLE Companies (
    companyID int  NOT NULL,
    companyName text  NOT NULL,
    size text  NOT NULL,
    location text  NOT NULL,
    premium boolean  NOT NULL,
    CONSTRAINT Companies_pk PRIMARY KEY (companyID)
);

-- Table: Connections
DROP TABLE IF EXISTS Connections CASCADE;
CREATE TABLE Connections (
    uID_1 int  NOT NULL,
    uID_2 int  NOT NULL,
    CONSTRAINT Connections_pk PRIMARY KEY (uID_1,uID_2)
);

-- Table: Job_Posts
DROP TABLE IF EXISTS Job_Posts CASCADE;
CREATE TABLE Job_Posts (
    jobID varchar  NOT NULL,
    name text  NOT NULL,
    "level" text  NOT NULL,
    salary text  NOT NULL,
    location text  NOT NULL,
    requirement text  NOT NULL,
    description text  NOT NULL,
    companyID int  NOT NULL,
    CONSTRAINT Job_Posts_pk PRIMARY KEY (jobID)
);

-- Table: Job_Seekers
DROP TABLE IF EXISTS Job_Seekers CASCADE;
CREATE TABLE Job_Seekers (
    jobSeekerID int  NOT NULL,
    searchingJobTitle text  NOT NULL,
    CONSTRAINT Job_Seekers_pk PRIMARY KEY (jobSeekerID)
);

-- Table: Messages
DROP TABLE IF EXISTS Messages CASCADE;
CREATE TABLE Messages (
    messageID int  NOT NULL,
    msg text  NOT NULL,
    uID int  NOT NULL,
    CONSTRAINT Messages_pk PRIMARY KEY (messageID)
);

-- Table: Notifications
DROP TABLE IF EXISTS Notifications CASCADE;
CREATE TABLE Notifications (
    notificationID int  NOT NULL,
    message text  NOT NULL,
    jobID varchar  NOT NULL,
    CONSTRAINT Notifications_pk PRIMARY KEY (notificationID)
);

-- Table: Notified
DROP TABLE IF EXISTS Notified CASCADE;
CREATE TABLE Notified (
    jobSeekerID int  NOT NULL,
    notificationID int  NOT NULL,
    CONSTRAINT Notified_pk PRIMARY KEY (jobSeekerID)
);

-- Table: Received_Messages
DROP TABLE IF EXISTS Received_Messages CASCADE;
CREATE TABLE Received_Messages (
    msg text  NOT NULL,
    uID int  NOT NULL,
    messageID int  NOT NULL,
    CONSTRAINT Received_Messages_pk PRIMARY KEY (messageID,uID)
);

-- Table: Recruiters
DROP TABLE IF EXISTS Recruiters CASCADE;
CREATE TABLE Recruiters (
    recruiterID int  NOT NULL,
    recruitingStatus text  NOT NULL,
    companyID int  NOT NULL,
    CONSTRAINT Recruiters_pk PRIMARY KEY (recruiterID)
);

-- Table: Saved_Jobs
DROP TABLE IF EXISTS Saved_Jobs CASCADE;
CREATE TABLE Saved_Jobs (
    jobSeekerID int  NOT NULL,
    jobID VARCHAR  NOT NULL,
    CONSTRAINT Saved_Jobs_pk PRIMARY KEY (jobSeekerID,jobID)
);

-- Table: Submissions
DROP TABLE IF EXISTS Submissions CASCADE;
CREATE TABLE Submissions (
    submissionDate date  NOT NULL,
    resumePath text  NOT NULL,
    jobSeekerID int  NOT NULL,
    applicationID varchar  NOT NULL,
    CONSTRAINT Submissions_pk PRIMARY KEY (jobSeekerID,applicationID)
);

-- Table: Users
DROP TABLE IF EXISTS Users CASCADE;
CREATE TABLE Users (
    uID int  NOT NULL,
    username text  NOT NULL,
    currentTitle text  NOT NULL,
    education text  NOT NULL,
    premium boolean  NOT NULL,
    experience text  NOT NULL,
    skill text  NOT NULL,
    language text  NOT NULL,
    honorsAndAwards text  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (uID)
);

-- foreign keys
-- Reference: Application_Job_Post (table: Applications)
ALTER TABLE Applications ADD CONSTRAINT Application_Job_Post
    FOREIGN KEY (jobID)
    REFERENCES Job_Posts (jobID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Connection_User1 (table: Connections)
ALTER TABLE Connections ADD CONSTRAINT Connection_User1
    FOREIGN KEY (uID_2)
    REFERENCES Users (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Connection_User2 (table: Connections)
ALTER TABLE Connections ADD CONSTRAINT Connection_User2
    FOREIGN KEY (uID_1)
    REFERENCES Users (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Job_Post_Company (table: Job_Posts)
ALTER TABLE Job_Posts ADD CONSTRAINT Job_Post_Company
    FOREIGN KEY (companyID)
    REFERENCES Companies (companyID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Job_Seeker_User (table: Job_Seekers)
ALTER TABLE Job_Seekers ADD CONSTRAINT Job_Seeker_User
    FOREIGN KEY (jobSeekerID)
    REFERENCES Users (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Message_User (table: Messages)
ALTER TABLE Messages ADD CONSTRAINT Message_User
    FOREIGN KEY (uID)
    REFERENCES Users (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Notification_Job_Post (table: Notifications)
ALTER TABLE Notifications ADD CONSTRAINT Notification_Job_Post
    FOREIGN KEY (jobID)
    REFERENCES Job_Posts (jobID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Notified_Job_Seeker (table: Notified)
ALTER TABLE Notified ADD CONSTRAINT Notified_Job_Seeker
    FOREIGN KEY (jobSeekerID)
    REFERENCES Job_Seekers (jobSeekerID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Notified_Notification (table: Notified)
ALTER TABLE Notified ADD CONSTRAINT Notified_Notification
    FOREIGN KEY (notificationID)
    REFERENCES Notifications (notificationID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ReceivedMessage_Message (table: Received_Messages)
ALTER TABLE Received_Messages ADD CONSTRAINT ReceivedMessage_Message
    FOREIGN KEY (messageID)
    REFERENCES Messages (messageID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ReceivedMessage_User (table: Received_Messages)
ALTER TABLE Received_Messages ADD CONSTRAINT ReceivedMessage_User
    FOREIGN KEY (uID)
    REFERENCES Users (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recruiter_Company (table: Recruiters)
ALTER TABLE Recruiters ADD CONSTRAINT Recruiter_Company
    FOREIGN KEY (companyID)
    REFERENCES Companies (companyID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recruiter_User (table: Recruiters)
ALTER TABLE Recruiters ADD CONSTRAINT Recruiter_User
    FOREIGN KEY (recruiterID)
    REFERENCES Users (uID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Saved_Job_Job_Post (table: Saved_Jobs)
ALTER TABLE Saved_Jobs ADD CONSTRAINT Saved_Job_Job_Post
    FOREIGN KEY (jobID)
    REFERENCES Job_Posts (jobID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Saved_Job_Job_Seeker (table: Saved_Jobs)
ALTER TABLE Saved_Jobs ADD CONSTRAINT Saved_Job_Job_Seeker
    FOREIGN KEY (jobSeekerID)
    REFERENCES Job_Seekers (jobSeekerID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Submission_Application (table: Submissions)
ALTER TABLE Submissions ADD CONSTRAINT Submission_Application
    FOREIGN KEY (applicationID)
    REFERENCES Applications (applicationID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Submission_Job_Seeker (table: Submissions)
ALTER TABLE Submissions ADD CONSTRAINT Submission_Job_Seeker
    FOREIGN KEY (jobSeekerID)
    REFERENCES Job_Seekers (jobSeekerID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

