from common import *

us='''
* US 2

   As a:  Recruiting Company
 I want:  See the total number of applicants for a job
So That:  I can analyze the level of interest and competitiveness for the position
'''

print(us)

def count_applicants(jobID):
    cols = 'applicationID'

    tmpl =  f'''
        SELECT COUNT(applicationID)
        FROM Applications
        WHERE jobID = %s   
    '''
    cmd = cur.mogrify(tmpl, (jobID,))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    pp(rows)
    show_table(rows, cols)

count_applicants('J108')    
