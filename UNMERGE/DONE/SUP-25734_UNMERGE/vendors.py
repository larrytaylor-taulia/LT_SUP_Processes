from __future__ import with_statement
import os

query = "SELECT sm.id from supplier_details sd, supplier_master sm WHERE sm.id = sd.supplier_master_id AND sd.number in \n ("

with open("sqlfile.sql", "w") as sql:
    sql.write(query)

with open("vendors.txt", "r") as vfile:
    lines = vfile.readlines()
    last = lines[-1]
    for line in lines:  
        x = line.split( )
        with open("sqlfile.sql", "a") as sql:  
            if line is last:  
               sql.write('\''+ x[0] + '\'\n')
            else:
               sql.write('\''+ x[0] + '\',\n')     

with open("sqlfile.sql", "a") as sql: 
     sql.write(')' +'\n')
     sql.write("AND sm.company_id = '8a0386f672801c730172a340b3b13ce6'")
