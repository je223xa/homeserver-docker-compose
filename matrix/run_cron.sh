#!/bin/bash

job_name=$1
shift
output=$("$@" 2>&1)
status=$?
message=$(tail -n 100 <<< "$output" | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's/"/\\"/g')
status_text=$(if [ $status -eq 0 ]; then echo 'success'; else echo 'failure'; fi)
# json_data=$(printf '{"job": "%s", "status": "%s", "message": "%s"}' "$job_name" "$status_text" "$message")
# text=$(printf '## job: %s \n \n- status: %s \n \n- message: %s' "$job_name" "$status_text" "$message")
text="## $job_name\n\n-  status: $status_text\n\n message: $message"
# curl -H 'Content-Type: application/json' -d "$json_data" $link
# echo $text # | jq -R -s -c 'split("\n")' | curl -H 'Content-Type: application/json'  -K .matrix.curlrc -d @-
echo "## $job_name" | curl -K /data/docker-compose/matrix/.matrix.curlrc -d @-
echo "status: $status_text" | curl -K /data/docker-compose/matrix/.matrix.curlrc -d @-
echo "message: $message" | curl -K /data/docker-compose/matrix/.matrix.curlrc -d @-
# echo $text | jq -R -s -c 'split("\n")' | curl -H 'Content-Type: application/json'  -K .matrix.curlrc -d @-
# curl -d "$json_data" $link
