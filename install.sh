#!/bin/bash

docker run -h hbase01.andy0010.com -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030   -v /Users/chenqiuyu/Documents/Kitematic/hbase:/opt/  --name=hbase01  -ti  andy0010/hbase
