#! /bin/bash


res=`vmstat -t | sed -n 3p | sed 's/ * / /g' | sed 's/^ //'`

mem_swap=`echo ${res} | cut -d " " -f 3-3`
mem_free=`echo ${res} | cut -d " " -f 4-4`
cpu_use=`echo ${res} | cut -d " " -f 13-13`
cpu_idl=`echo ${res} | cut -d " " -f 14-14`
cpu_wit=`echo ${res} | cut -d " " -f 15-15`
time_t=`echo ${res} | cut -d " " -f 18- | sed 's/ /T/g'`
time=`echo ${res} | cut -d " " -f 18- | sed 's/ //g' | sed -e 's/\///g' -e 's/\-//g' -e 's/\://g'`

host_name=`hostname`

request="{
\"memory_swap\" : ${mem_swap},
\"memory_free\" : ${mem_free},
\"cpu_use\"  : ${cpu_use},
\"cpu_idol\" : ${cpu_idl},
\"cpu_wait\" : ${cpu_wit},
\"crate_time\" : \"${time_t}\"
}"

echo `curl -H "Content-Type: application/json" -XPUT "https://10.100.24.10:9200/${host_name}/status/${time}" -u admin:admin --insecure  -d "${request}"`