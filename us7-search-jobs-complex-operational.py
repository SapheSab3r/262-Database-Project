from common import *

us='''
* US 7

   As a:  Job Seeker
 I want:  utilize the advanced search functionality with specific filters like job title, experience level, and location
So That:  I can efficiently find job opportunities that match my career goals and qualifications

'''

print(us)

def search_jobs(jobTitle, level, location):
    tmpl = f'''
        SELECT jobID, name, level, location, requirement
        FROM Job_Posts
        WHERE name = %s AND level = %s AND location = %s
    '''
    cmd = cur.mogrify(tmpl, (jobTitle, level, location))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    if rows:
        for row in rows:
            print(row)
    else:
        print("No jobs found")

#Example usage
search_jobs("Backend Engineer", "Internship", "Seattle, WA")