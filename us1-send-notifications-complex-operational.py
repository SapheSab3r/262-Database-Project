from common import *

us='''
* US 1

   As a:  Recruiting Company
 I want:  Send notifications when a new job is posted
So That:  Users are inclined to apply early to ensure an efficent hiring process
'''

print(us)

# trigger event
def adding_new_job(jobID, name, level, salary, location, requirement, description, companyID):
    
    cols = 'jobID name level salary location requirement description companyID'

    tmpl =  f'''
        INSERT INTO Job_Posts(jobID, name, level, salary, location, requirement, description, companyID)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s);

        SELECT {c(cols)}
          FROM Job_Posts;
    '''
    cmd = cur.mogrify(tmpl, (jobID, name, level, salary, location, requirement, description, companyID))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    show_table( rows, cols )
 

# printing notifications table to see trigger update
def send_notifications():

    cols = 'notificationID message jobID'

    tmpl =  f'''
    SELECT {c(cols)}
      FROM Notifications;  
    '''
    cmd = cur.mogrify(tmpl, ())
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    show_table( rows, cols )

adding_new_job('J113','Frontend Engineer','Internship',"$30,000 - $40,000","Seattle, WA",
               "Basic knowledge of TypeScript and LESS",
               'Assist in software development projects and learn coding best practices',4)
send_notifications()    
