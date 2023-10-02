from __future__ import with_statement
import os


query = "start transaction;\n\n UPDATE invoice\nSET\n    status = '512',\n    last_updated = NOW(),\n    version = version + 1\nWHERE\n    id in ("
infile = "pendingToChange"
outfile = "SUP-26097_UpdateInvoices.sql"


with open( outfile, "w" ) as sql:
    sql.write(query)

with open( infile, "r" ) as vfile:
    lines = vfile.readlines()
    last = lines[-1]
    for line in lines:  
        x = line.strip().split(',')
        with open(  outfile, "a" ) as sql:  
            if line is last:  
               sql.write('\''+ x[0] + '\');')
               sql.write('\ncommit;\n')
            else:
               sql.write('\''+ x[0] + '\',\n')     

