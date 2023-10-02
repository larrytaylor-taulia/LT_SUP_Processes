from __future__ import with_statement
import os

query = "select  i.id, i.status, m.status_text,i.number, i.po_number from invoice i, app_support.invoice_status_map m where i.number in \n ("

with open("Getsqlfile.sql", "w") as sql:
    sql.write(query)

with open("InvoiceData.txt", "r") as vfile:
    lines = vfile.readlines()
    last = lines[-1]
    for line in lines:  
        x = line.strip().split(',')
        with open("Getsqlfile.sql", "a") as sql:  
            if line is last:  
               sql.write('\''+ x[0] + '\'')
            else:
               sql.write('\''+ x[0] + '\',\n')     

with open("Getsqlfile.sql", "a") as sql: 
     sql.write(')' +'\n')
     sql.write("AND i.po_number in (")

with open("InvoiceData.txt", "r") as vfile:
    lines = vfile.readlines()
    last = lines[-1]
    for line in lines:  
        x = line.strip().split(',')
        with open("Getsqlfile.sql", "a") as sql:  
            if line is last:  
               sql.write('\''+ x[1] + '\')\n')
            else:
               sql.write('\''+ x[1] + '\',\n')     

with open("Getsqlfile.sql", "a") as sql: 
        sql.write("AND i.status = m.status_id;\n")
    
