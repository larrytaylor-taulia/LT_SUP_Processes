from __future__ import with_statement
import os

query = "SELECT\n  sm.id\nFROM\n   supplier_details sd\nJOIN\n    supplier_master sm ON sm.id = sd.supplier_master_id\n WHERE\n sm.company_id = '8a0386f672801c730172a340b3b13ce6'\n"

with open("supplierDetails.sql", "w") as sql:
    sql.write(query)

with open("IN_vendors.txt", "r") as vfile:
    lines = vfile.readlines()
    first = lines[0]
    last = lines[-1]
    for line in lines:  
        x = line.split( )
        with open("supplierDetails.sql", "a") as sql:  
            if line is first:  
               sql.write('AND (sd.number LIKE \'%'+ x[0] + '\'\n')
            else:
               sql.write('OR sd.number LIKE \'%'+ x[0] + '\'\n')  
            if line is last:   
               sql.write('OR sd.number LIKE \'%'+ x[0] + '\')')      


    
