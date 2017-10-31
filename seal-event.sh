#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bin=${DIR}/../bin
lib=${DIR}/../lib

echo '
{
   "type" : "jdbc",
    "jdbc" : {
        "url" : "jdbc:mysql://10.200.3.184:3306/finance",
        "user" : "lvmama_finance",
        "password" : "lvmama_finance",
        "sql" :  "select *,event_id as _id from set_settlement_item",
        "treat_binary_as_string" : true,
        "elasticsearch" : {
             "cluster" : "es-test",
             "host" : "10.112.2.54",
             "port" : 9300
        },
        "index":"finance_log",
        "type" :"event_logging"
    }
}
' | java \
    -cp "${lib}/*" \
    -Dlog4j.configurationFile=${bin}/log4j2.xml \
    org.xbib.tools.Runner \
    org.xbib.tools.JDBCImporter

	
	
	
curl -XPOST "http://10.112.2.54:9200/finance" -d '{
  "mappings": {
      "settleEvent": {
                "properties": {
				    "event_id" : {
                        "type" : "string"
                    },
					"event_type" : {
                        "type" : "string"
                    },
					"event_text" : {
                        "type" : "string"
                    },
					"object_id" : {
                        "type" : "string"
                    },
					"event_detail" : {
                        "type" : "string"
                    },
					"create_time" : {
                        "type" : "date"
                    },
					"thread_name" : {
                        "type" : "string"
                    },
					"transaction_id" : {
                        "type" : "string"
                    },
					"sequence" : {
                        "type" : "long"
                    },
					"operator" : {
                        "type" : "string"
                    }
                }
			}
		}
    }'