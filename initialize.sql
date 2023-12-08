-- drop the linkedin database if it exists
DROP database if EXISTS linkedin;

-- create it afresh
CREATE database linkedin;
\c linkedin

\i create.SQL

-- load the data

\copy Application(applicationID, applicationStatus, jobID) FROM data/applications.csv csv header;
-- \copy Companies(companyID, companyName, size, location, premium) FROM data/companies.csv csv header;
-- \copy Connections(uID_1, uID_2) FROM data/connections.csv csv header;
-- \copy Job_Seekers(uID, searchingJobTitle) FROM data/job_seekers.csv csv header;
-- \copy Jobs(jobID, name, level, salary, location, requirement, description, companyID, notificationID) FROM data/jobs.csv csv header;
-- \copy Messages(messageID, msg, uID) FROM data/messages.csv csv header;
-- \copy Notifications(notificationID, message) FROM data/notifications.csv csv header;
-- \copy Notified(uID, notificationID) FROM data/notified.csv csv header;
-- \copy Received_Messages(messageID,uID) FROM data/received_messages.csv csv header;
-- \copy Recruiters(uID,recuritingStatus,companyID) FROM data/recruiters.csv csv header;
-- \copy Submissions(uID,applicationID,submissionDate,submissionPath) FROM data/submissions.csv csv header;
-- \copy Users(uID,username,currentTitle,education,premium,experience,skill,language,honorsAndAwards) FROM data/users.csv csv header;




