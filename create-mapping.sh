#!/bin/sh

curl -XPUT 'localhost:9200/_river/finance/_meta' -d '{
	"strategy" : "simple",
	"interval" : 0,
	"flush_interval" : "5s",
	"type" : "jdbc",
	"jdbc": {
		"driver": "com.mysql.jdbc.Driver",
		"url": "jdbc:mysql://localhost:3306/finance",
		"user": "root",
		"password": "root",
		"sql": "select *,settlement_item_id as _id from set_settlement_item",
		"interval":"5",
		"index":"finance",
        "type" :"settlementItem"
	}
}'