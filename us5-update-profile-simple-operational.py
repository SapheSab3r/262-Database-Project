from common import *

us='''
* US 2

   As a:  Job Seeker
 I want:  update my profile with my current experience
So That:  My profile is up-to-date and attracts potential recruiters to connect with me
'''

print(us)

def update_profile():

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

update_profile()    