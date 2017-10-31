#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bin=${DIR}/../bin
lib=${DIR}/../lib

echo '
{
   "type" : "jdbc",
    "jdbc" : {
        "url" : "jdbc:mysql://localhost:3306/finance",
        "user" : "root",
        "password" : "root",
        "sql" :  "select *,settlement_item_id as _id from set_settlement_item",
        "treat_binary_as_string" : true,
        "elasticsearch" : {
             "cluster" : "my-application",
             "host" : "localhost",
             "port" : 9300
        },
        "index":"finance",
        "type" :"settlementItem"
    }
}
' | java \
    -cp "${lib}/*" \
    -Dlog4j.configurationFile=${bin}/log4j2.xml \
    org.xbib.tools.Runner \
    org.xbib.tools.JDBCImporter