from common import *

us='''
* US 6

   As a:  Job Seeker
 I want:  see the total number of jobs I have applied
So That:  I can keep track of my job search efforts
'''

print(us)

def count_applications(jobSeekerID):
    tmpl = f'''
         SELECT COUNT(s.applicationID)
           FROM Job_Seekers AS j LEFT JOIN Submissions AS s 
                ON j.jobSeekerID = s.jobSeekerID
          GROUP BY j.jobSeekerID 
         HAVING j.jobSeekerID = %s
    '''
    cmd = cur.mogrify(tmpl, (jobSeekerID,))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    if rows:
        count = rows[0][0] #get the first value from first tuple from the list
        result_message = f"The total number of applications for Job Seeker ID {jobSeekerID} is: {count}"
        print(result_message)
    else:
        print("No applications found.")

count_applications(1)