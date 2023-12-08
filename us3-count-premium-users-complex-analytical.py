from common import *

us='''
* US 2

   As a:  LinkedIn Business Manager
 I want:  view a count of all premium users and companies
So That:  I can gauge how many users are using premium to determine the allocation 
          of future marketing strategies
'''

print(us)

def count_premium_users():

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

count_premium_users()    
