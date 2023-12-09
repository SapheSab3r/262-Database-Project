from common import *

us='''
* US 8

   As a:  Recruiting Company
 I want:  to post a job listing with a job description, skills requirements, and hiring position
So That:  I can attract qualified candidates to apply for these new positions
'''

print(us)

def post_jobs(jobID, name, salary, location, level, requirement, description, companyID):
    tmpl = f'''
        INSERT INTO Job_Posts(jobID, name, "level", salary, location, requirement, description, companyID)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
'''
    cmd = cur.mogrify(tmpl, (jobID, name, salary, location, level, requirement, description, companyID))
    print_cmd(cmd)
    cur.execute(cmd)
    print("A new Job post is successfully created!")


def print_table():
    query = f'''
    SELECT * from Job_Posts
'''
    cur.execute(query)  
    rows = cur.fetchall()  
    if not rows:
        print("The table is empty.")
    else:
        cols = "jobID name level salary location requirement description companyID"

        show_table(rows, cols)

# Example usage
print("original table:")
print_table()
post_jobs("J113", "Frontend Engineer", "Internship", "$20,000-$30,000", "New York", "React, HTML/CSS", "Developing and maintaining software applications, building web pages", 2)
print("updated table:")
print_table()