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





