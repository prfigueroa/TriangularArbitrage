#!/bin/sh

j=0

while [ $j -lt 24 ]
        do

        i=0

        jsonArgs=$3
        echo $3

        CALL="cleos --url https://api.eosn.io --wallet-url http://127.0.0.1:5555 push action -j automationpr t '[]' -x 3600 -d -p deguebuernif@active --return-packed > $2"
        eval $CALL

        CALL="cleos --url https://api.eosn.io --wallet-url http://127.0.0.1:5555 push action -j automationpr t '[]' -x 3600 -d -p deguebuernif@active --return-packed >> $2"
        eval $CALL
        eval $CALL
        eval $CALL
        eval $CALL
        eval $CALL
        eval $CALL
        eval $CALL
        eval $CALL

        (jq -s -c '.[0] += .[0]' < $2 ) > $4

        value=`cat $4`
        echo "content is $value"

        while [ $i -lt 1750 ]
                do

                k=0
                while [ $k -lt 2 ]
                        do
                                                
                        NAMES=""
                        NAMES="${NAMES} https://api.eosn.io"
                        NAMES="${NAMES} https://mainnet.eoscannon.io"
                        NAMES="${NAMES} https://api1.eosasia.one"

                        echo 'One at a time...'
                        for NAME in ${NAMES}; do
                            echo ${NAME};
                            cleos --url ${NAME} --wallet-url http://127.0.0.1:5555 push transactions $value &
                        done
                        
                        k=$((k+1))
                done

                sleep 1

                i=$((i+1))
        done

        j=$((j+1))
done
