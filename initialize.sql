-- drop the project database if it exists
DROP database if EXISTS project;

-- create it afresh
CREATE database project;
\c project

\i create.SQL

-- load the data

\copy Companies(companyID, companyName, size, location, premium) FROM data/companies.csv csv header;
\copy Job_Posts(jobID, name, level, salary, location, requirement, description, companyID) FROM data/job_posts.csv csv header;
\copy Notifications(notificationID, message, jobID) FROM data/notifications.csv csv header;
\copy Users(uID, username, currentTitle, education, premium, experience, skill, language, honorsAndAwards) FROM data/users.csv csv header;
\copy Job_Seekers(jobSeekerID, searchingJobTitle) FROM data/job_seekers.csv csv header;
\copy Recruiters(recruiterID, recruitingStatus, companyID) FROM data/recruiters.csv csv header;
\copy Connections(uID_1, uID_2) FROM data/connections.csv csv header;
\copy Sent_Messages(messageID, msg, uID) FROM data/sent_messages.csv csv header;
\copy Notified(jobSeekerID, notificationID) FROM data/notified.csv csv header;
\copy Saved_Jobs(jobSeekerID, jobID) FROM data/saved_jobs.csv csv header;
\copy Applications(applicationID, applicationStatus, jobID) FROM data/applications.csv csv header;
\copy Submissions(jobSeekerID, applicationID, submissionDate, submissionPath) FROM data/submissions.csv csv header;
\copy Received_Messages(messageID, uID) FROM data/received_messages.csv csv header;


-- Trigger Function for User Story 1
CREATE FUNCTION fn_send_notifications()
RETURNS trigger
LANGUAGE plpgsql AS
$$
DECLARE
    company_name TEXT;
    job_name TEXT;
    job_level TEXT;
    notification_id INT;
    msg TEXT;
BEGIN
-- Retriving company name from company table to add to notification message
    SELECT c.companyName INTO company_name
    FROM Companies c
    JOIN Job_Posts j ON c.companyID = j.companyID
    WHERE c.companyID = NEW.companyID;

-- Retriving job name to add to notification message
    SELECT name INTO job_name
      FROM Job_Posts
     WHERE name = NEW.name;

-- Retriving job level to add to notification message
    SELECT level INTO job_level
      FROM Job_Posts
     WHERE level = new.level;

    msg := 'A ' || job_name || ' ' || job_level || ' job at ' || company_name || ' has just been released!';

    -- Extracting numeric portion from jobID and casting it to integer for notificationID
    notification_id := CAST(substring(NEW.jobID FROM '[0-9]+') AS INTEGER);

    -- Subtracting 100 from the notificationID
    notification_id := notification_id - 100;

    INSERT INTO Notifications(notificationID, message, jobID)

    VALUES(notification_id, msg, NEW.jobID);

    RETURN NULL;
END;
$$;


-- Trigger for US 1
CREATE TRIGGER tr_send_notifications
AFTER INSERT ON Job_Posts
FOR EACH ROW
EXECUTE FUNCTION fn_send_notifications();


-- Trigger Function for User Story 9
CREATE OR REPLACE FUNCTION fn_update_message_received() 
RETURNS trigger
LANGUAGE plpgsql AS
$$
    BEGIN
        INSERT INTO Received_Messages(messageID, uID)
        VALUES (NEW.messageID, NEW.uID);

        RETURN NULL;
    END;
$$;

-- Trigger for US 9
CREATE TRIGGER tr_update_message_received
AFTER INSERT ON Sent_Messages
FOR EACH ROW
EXECUTE FUNCTION fn_update_message_received()
