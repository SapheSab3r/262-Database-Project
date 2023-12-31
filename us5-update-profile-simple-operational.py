from common import *

us='''
* US 5

   As a:  Job Seeker
 I want:  update my profile with my current experience
So That:  My profile is up-to-date and attracts potential recruiters to connect with me
'''

print(us)

# printing the profile before it gets updated
def profile_before_update(uID):
    
    cols = 'uID username currentTitle education premium experience skill language honorsAndAwards'

    tmpl =  f'''
    SELECT  {c(cols)}
      FROM Users 
     WHERE uID = %s;
'''
    cmd = cur.mogrify(tmpl, (uID,))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    show_table( rows, cols )


def update_profile(uID, currentTitle):

    cols = 'uID username currentTitle education premium experience skill language honorsAndAwards'

    tmpl =  f'''
    UPDATE Users
       SET currentTitle = %s
     WHERE uID = %s;   

    SELECT  {c(cols)}
      FROM Users 
     WHERE uID = %s;
'''
    cmd = cur.mogrify(tmpl, (currentTitle, uID, uID))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    show_table( rows, cols )

# Example usage
print("Profile Before Update:")
profile_before_update(5)   

print("Profile After Update:")
update_profile(5, 'SWE @ Microsoft')    