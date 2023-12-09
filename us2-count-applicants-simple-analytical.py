from common import *

us='''
* US 2

   As a:  Recruiting Company
 I want:  See the total number of applicants for a job
So That:  I can analyze the level of interest and competitiveness for the position
'''

print(us)

def count_applicants(jobID):

    tmpl =  f'''
        SELECT COUNT(applicationID)
        FROM Applications
        WHERE jobID = %s   
    '''
    cmd = cur.mogrify(tmpl, (jobID,))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    count = rows[0][0]
    result_message = f"The total number of applicants for JobID {jobID} is: {count}"
    print(result_message)


count_applicants('J108')    
