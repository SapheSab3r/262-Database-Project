from common import *

us='''
* US 1

   As a:  Recruiting Company
 I want:  Send notifications when a new job is posted
So That:  Users are inclined to apply early to ensure an efficent hiring process
'''

print(us)

def send_notifications():

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

send_notifications()    
