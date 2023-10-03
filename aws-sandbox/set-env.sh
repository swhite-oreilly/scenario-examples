chmod +x /opt/get-aws
for i in {1..20}; do /opt/get-aws && . ~/.awsenv && break || sleep 1; done
