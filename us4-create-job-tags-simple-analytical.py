from common import *

us='''
* US 2

   As a:  LinkedIn Business Manager
 I want:  create job tags by experience level
So That:  The job search is less cluttered and maintains relevance to the user
'''

print(us)

def create_job_tags():

    # cols = 'b.bid b.severity i.initial_date i.product i.status i.priority u.uid u.name u.role'

#     tmpl =  f'''
# SELECT {c(cols)}
#   FROM Bugs as b
#        JOIN Issues as i ON b.bid = i.iid
#        JOIN Users as u ON i.uid = u.uid
#  WHERE i.status <> 'resolved'
#  ORDER BY b.severity DESC    
# '''
#     cmd = cur.mogrify(tmpl, ())
#     print_cmd(cmd)
#     cur.execute(cmd)
#     rows = cur.fetchall()
#     show_table( rows, cols )

create_job_tags()    
