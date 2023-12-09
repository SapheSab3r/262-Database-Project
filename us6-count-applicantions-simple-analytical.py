from common import *

us='''
* US 6

   As a:  Job Seeker
 I want:  see the total number of jobs I have applied
So That:  I can keep track of my job search efforts
'''

print(us)

def count_applications(jobSeekerID):
    cols = 'applicationID'

    tmpl = f'''
         SELECT COUNT(s.applicationID)
           FROM Job_Seekers AS j LEFT JOIN Submissions AS s 
                ON j.jobSeekerID = s.jobSeekerID
          GROUP BY j.jobSeekerID 
         HAVING j.jobSeekerID = %s
    '''
    cmd = cur.mogrify(tmpl, (jobSeekerID))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    pp(rows)
    show_table(rows, cols)

count_applications(1)