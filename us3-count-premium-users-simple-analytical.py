from common import *

us='''
* US 3

   As a:  LinkedIn Business Manager
 I want:  view a count of all premium users and companies
So That:  I can gauge how many users are using premium to determine the allocation 
          of future marketing strategies
'''

print(us)

def count_premium_users():

    tmpl =  f'''
        SELECT COUNT(uID)
        FROM Users
        WHERE premium = TRUE 
    '''
    cmd = cur.mogrify(tmpl, ())
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    count = rows[0][0]
    result_message = f"The total number of premium users is: {count}"
    print(result_message)

count_premium_users()    
