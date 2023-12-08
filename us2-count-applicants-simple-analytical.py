from common import *

us='''
* US 2

   As a:  Recruiting Company
 I want:  See the total number of applicants for a job
So That:  I can analyze the level of interest and competitiveness for the position
'''

print(us)

def count_applicants():

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

count_applicants()    
