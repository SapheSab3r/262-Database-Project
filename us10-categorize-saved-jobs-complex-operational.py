from common import *

us='''
* US 10

   As a:  Job Seeker
 I want:  categorize my saved jobs by their locations
So That:  I can see where the jobs I am applying to are, to aid in my decision making
'''

print(us)

def categorize_saved_jobs_by_locations(jobSeekerID):
    tmpl = '''
        SELECT jp.location, COUNT(jp.jobID) AS Job_count 
          FROM Saved_Jobs AS s JOIN Job_Posts AS jp
               ON s.jobID = jp.jobID
         WHERE s.jobSeekerID = %s
         GROUP BY jp.location
         ORDER BY Job_count
    '''
    cmd = cur.mogrify(tmpl, (jobSeekerID,))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    if rows:
        print("Saved Jobs:")
        pp(rows)
    else:
        print("No jobs saved.")

categorize_saved_jobs_by_locations(5) 
