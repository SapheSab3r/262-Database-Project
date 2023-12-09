from common import *

us='''
* US 4

   As a:  LinkedIn Business Manager
 I want:  create job tags by experience level
So That:  The job search is less cluttered and maintains relevance to the user
'''

print(us)

def create_job_tags(level):

    cols = 'jobID name level salary location requirement description companyID'

    tmpl =  f'''
    SELECT {c(cols)}
      FROM Job_Posts
     WHERE level = %s
    '''
    cmd = cur.mogrify(tmpl, (level,))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    pp(rows)
    show_table( rows, cols )

create_job_tags('Internship')    
