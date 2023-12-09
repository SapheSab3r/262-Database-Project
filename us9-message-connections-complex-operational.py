from common import *

us='''
* US 9

   As a:  Job Seeker
 I want:  message my connections that work at a company I am applying to 
So That:  I can learn more about the hiring process through someone I know
'''

print(us)

def message_connections(messageID, msg, uID):
    tmpl = f'''
         INSERT INTO Sent_Messages(messageID, msg, uID)
         VALUES (%s, %s, %s) 
    '''
    cmd = cur.mogrify(tmpl, (messageID, msg, uID))
    print_cmd(cmd)
    cur.execute(cmd)
    print("A new message is sent!")


def print_table():
    query = f'''
    SELECT * from Sent_Messages
'''
    cur.execute(query)  
    rows = cur.fetchall()  
    if not rows:
        print("The table is empty.")
    else:
        cols = "messageID msg uID"
        show_table(rows, cols)

# Example usage
print("original table:")
print_table()
message_connections(8, "Hi, I am interested in this role. Can we connect to talk more about this position?", 9)
print("updated table:")
print_table()




