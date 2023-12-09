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


def print_table(table_name):
    query = f'SELECT * FROM {table_name}'
    cur.execute(query)  
    rows = cur.fetchall()  
    if rows:
        # Fetch column headers as a list
        cols = [desc[0] for desc in cur.description]
        # Convert the list of column headers to a string
        cols_str = ' '.join(cols)
        show_table(rows, cols_str)
    else:
        print(f"The {table_name} table is empty.")

# # printing received_message table to see trigger update
# def print_received_message_table():
#     query = f'''
#     SELECT * from Received_Messages
# '''
#     cur.execute(query)  
#     rows = cur.fetchall()  
#     if not rows:
#         print("The table is empty.")
#     else:
#         cols = "messageID uID"
#         show_table(rows, cols)
        
# Example usage

# Printing original tables
print("original table:")
print_table("Sent_Messages")

print("Original Received_Messages table:")
print_table("Received_Messages")

# Sending a message
message_connections(9, "Hi, I am interested in this role. Can we connect to talk more about this position? Thank you", 8)

# Printing updated tables
print("Updated Sent_Messages table:")
print_table("Sent_Messages")

print("Updated Received_Messages table:")
print_table("Received_Messages")




