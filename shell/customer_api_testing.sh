# date
for (( i=0; i<10000; i++))
do
    echo `date`
    curl http://localhost:3000/customer-management-service/v1/customers/40190957
    # echo "\n"
    echo "\n `date` "
done    