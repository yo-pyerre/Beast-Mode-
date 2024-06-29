#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <argument>"
    exit 1
fi

YYYYMM=$1
DD=06

ACCOUNT=512039606105

RESP="resp.json"

echo "Fetching bill for month: $MONTH_STRING"

BASE_URL="https://www.att.com/msapi/billorchestratorms/v2/billOrchestrator/downloadpdf"

PAYLOAD="{\"account\":\"$ACCOUNT\",\"accounttype\":\"TLG\",\"stmtIDStr\":\"$YYYYMM$DD-$ACCOUNT-TLG-W\"}"

echo $PAYLOAD

RESPONSE=$(curl \
  -o $RESP \
  --header "Content-Type: application/json" \
  -H $'cookie: gtmuf=aze2; att-appshell-path=/marketing/; rxVisitor=1719683193364E5MVC03918OTMPION5LJBJFRG4MG551S; AMCVS_55633F7A534535110A490D44%40AdobeOrg=1; at_check=true; attpc-opt={"c":[{"type":"m","value":"n"},{"type":"n","value":"y"}],"consent":"g","gpc":"y"}; idse_stack=ffdc; azure_ssaf_stack=ssafeastus2; CIP=71.172.9.10; gtmps=ffdc; gtmsales=aze2; _fbp=fb.1.1719683198052.736008290; _gcl_au=1.1.1550070498.1719683198; _meta_neustar_fabrickId_failure=failed to make request; _meta_neustar_a_failure=failed to make request; _meta_neustar_b_failure=failed to make request; idp-source=EMPTY; aacState=true; Kd4zPCrb=A0c7G2WQAQAASkKQbRCBqrQo_5RlBH1NzO2vFByG1rkmjuGRgIMUKMl34zANAUesCQqucuopwH8AAEB3AAAAAA|1|0|11fe4045b32db9bef043ff785b5aaa47aa887188; c_p_browser_refID=3EnmKIoUOXWwR+Ep85HJa/WFs0BwOioKL6VMLUigkjg=; attathv=012721; CIAM_DATA=AAAAECp3JGidtuSQDef_DdcUliAWjUjWakwLtSakQcaB_jd6yyJ0RykM6WK8ay4V_DPAlSWDNnUF-4fIWPAlvRA4CXpXwjozz8BFlKSqL1TZgcqpcF5FA0GVWZa2O0ds7dNMJcVkJ6icerzXvu5YHIjRqDAmLLRpf7qcuG0_Y4UbVo7x3tRS00GFUqnpgo1Ub2PmFweU6THBeY44H7xkBo9VweFC0fYsbQddyPJ6TYA2eWs3eVqJdnNdoocmgrPTEG6XzFZzJqaygphYwayaGRkDKK1X1ps; UUID=146517632; gtmgrph=azw2; ajs_anonymous_id=146517632; ajs_user_id=146517632; dtSa=-; stack=dprod04; olam_haloc_stack=847; ak_bmsc=AA6A56C94AFDF199AF08F5DFE4B2337D~000000000000000000000000000000~YAAQjALEFw1g/liQAQAALgudZRg8t/v5FDgA8q6jDN2hs/7w3FeDMH+U3saNk+WRzYQWMnuW+TwHcTEWcETI4LFrwHHHuGKupXY+pWeTH7ejeE7Blv7w6zMJrj0YfPRvGbFzDQh0qSmJym/AxNGES/wHwEX+6bWRuKMmaxoFRRDoiRCqqMSq85gEiw2XNSl8Msc5ANJPXWXjDC0A8WiYK3NppH5Jq7WstoyCpr1JVt3BYNMpd5KeVxjgKc72VpjCUEL1B2h7VNqnImvYrD2jK6k1LeM8721tIxuXQJMKH/FvOd8ZeSfzIvGZgGITFm+v+28Ixmmf0xkN9N9bSicKpB/LUX0e6GUL9sSmZTFtB5qkChEERBs6xmheMPj65ISgtDQPgyw=; AMCV_55633F7A534535110A490D44%40AdobeOrg=1994364360%7CMCMID%7C02912385439582454717674478389112260624%7CMCAID%7CNONE%7CMCOPTOUT-1719698933s%7CNONE%7CvVersion%7C3.4.0; ChatAB=MEG; BESTSESSIONID=PHFlvxEHxT2664VN107rCw0-L0ki1BiZxHtdlBNFZZAevPP_EeVe\u00211682540301; SRVCSESSIONID=PHFlvxEHxT2664VN107rCw0-L0ki1BiZxHtdlBNFZZAevPP_EeVe\u00211682540301; _abck=CA44E117A8D2D572606E9FDDBDF6F242~0~YAAQhgLEF1SLNE6QAQAASCwBZgxP2U1UnXO0/pLAevnFQk2UxRy7s/uP+A7jRctH2Gg3jQWjBKNrSc5DPd7WcSwWnqtLKvH1oMzce37+N9tX0IT40C8cG3I26NAIRKtZVyrvV0trHmZ/MK/UB1Bp+nhX7tThXLXhmLryn4DpPKYpoy1HoMOEvYGh1PWJJVsUagVeq3y6n1yWhMm8ahZa+PezE7y4dzuHtkdb/J9EtyYFpJjJ6zRDRnrIo684rt0dSBW7xYDvQEmQxWcTd7igNoq55rz/j2CvSXfMki9B8PNqkdb1KzKfGFkIQtulRid7EZ197Thzvfoh3E2U8QqB06Kqmy5N3cQKdGboQ7wDq7zpHknVUdXlDCKHCNTUpBuINbysHSlkJfpmXkyPTBDNakx1HzF+~-1~-1~-1; AKA_A2=A; tAuthNState=true; cAuthNState=ksaidenmd@slid.dum:1719701895591:en; c_d_state=AAAAEM4TgmxgocLDkYESYfgRBHT507VdPjDaWQG53DiLv1UevlAOfWdBdupcVNBzc6iINTt8ZQUhbFYAIO8mA_zrgLuNvvOZFMwD9aLlslnYHK342OQzfUB7__z0SPfyQqlm1ez6hyCQSXIvh8EPt_StrZRAV3YUGCZrNJ5KhLgjSQF-iSvYWsS_4S-EPZ4ewgZ4yzLsnFoFitc52A; halologinstate=%7B%22final_url%22%3A%5B%5D%2C%22cauthnstate%22%3A%22ksaidenmd%40slid.dum%3A1719701895591%3Aen%22%2C%22cid%22%3A%22m14186%22%7D; mboxEdgeCluster=34; ixp=5d778cd8-d6f7-4381-942f-a6c09049822c; bm_mi=755278A30EFA68196B705BE6AAC663D3~YAAQhgLEF6yVNE6QAQAA/MsBZhgey1EeEPEOxcFK4Apw9MM9G1UoX6zR+dOa3BGRxpOFqud5H4RnqA9LyZJuJ/j8tzrScYcXzea00vt4kmWyLV4pukOrzJK34B9fvh0CZz5gJ2mNtJu1SPbAhAsiCRdxAFt511R5Mgbv2ub3tKrK1BrYfNfnIKF2+1OIIyxncMm3eMuIbmxIBm7BuAsv3wpF0vJ9ktlO0luO/ZklMj58mL4LtlODGYjh5gZhVCUwzvdbGd5h1UMJ8A6kexyMIlaVtHcK0/rlm/uo3MKpGK8GvUOiM16byj7ld4cWDYYxmemlGTGQjDvGtJCoH852MqIcWGCW/UH5lvejWQQ=~1; bm_sz=E6B06ED9E3252322E19BB9F4C3171470~YAAQhgLEF8iVNE6QAQAAGs4BZhjJkAqQu2U9md3Lr0FzNqK5fdty8L0YtNnmKWYhUGwXJhhj5JYgBZkRtdVgcxvO8XmYA7M9H0wNi15/NUMmdXjx/C3NiSKnndklVTnKKpYodyds61FG9JVh0s7CaxXlNJ89WaZeMxvr2IJTEed5IyMzghgfz2nSxqIDh5TSobxBv6ZNCwdOYWDsy5w/EtODA8eVAZi1SLGELg9c3KmemPi86xNDlA7OTIwNTbiWStL9KKhiRgFbzhUjRhBH9lW38mqZ57Eec6ilbN93TjFduEEfongXYIVebvkP7o3t5IZ9PcqKA84h4mV/Q52bu57WZuhxuxEf14oqF7Jz5nKOUDKaaU6ub9ymGmPwGJZU7SLEFdE2xDRsQ1D6+KvZngDjxu9o88Xc3BqbvQQeepV+AVWDEOJEh0c=~4471090~4276793; mbox=PC#3ffd148e10d24547a538faa5c59aa073.34_0#1782943116|session#684ac1240ce443bab63ec984690ab617#1719700176; GNSESS={"UG":["Auth","CESlidLogin","CEWireless"],"FANID":"SVndM6rCCU68r6GE4bRY8w%3D%3D","APC":1,"SKA":[["1","jsp"],["4","myatt"]],"LOCALE":"en-US","ENC":"LF8ayecdAF0YFj4ahtSg0kOxdp0Tz0RmeNUBXBPVln4Ry6kH0UuS%2BBed4SpiQ2nGcbSFKU6zJbXyvJf1uoRGIbWju7XHPFOJTvCp22wqZch2KMD9k9UlJPToqzhxxV02","FN":"Kanwardeep","AR1":1,"AR3":1}; _meta_googleGtag_session_id=1719698323; _meta_facebookTag_sync=1719698324230; _meta_googleGtag_ga_session_count=1; _meta_facebookTag_sync_63973384029222=1719698324234; _meta_googleGtag_ga=GA1.2.287787944.1719698324; _meta_googleGtag_ga_library_loaded=1719698324281; dtCookie=v_4_srv_29_sn_97669D58D13540488EEBFB4B3FBBA6EC_perc_100000_ol_0_mul_1_app-3A7e91229232cd3329_1; idpmgw=eyJjcyI6IkF1dGgiLCJjb252LWlkIjoiMTQ2NTE3NjMyXzdmMDBlMDFhMTU2Y2QxNTBhMzRmOWJlYzdkODhmYjVkIiwidWF1dWlkIjoiMTQ2NTE3NjMyIiwidGF0c1JlcyI6InNyM3A0SEttMFJzc1pPbzFISlpTaW1UcTAyU2oyUEdreUVib0NTRGRwSWVxRzRZemNGRm10dngvTTZFREo1aVI0amt6WVN2bTJYSDFweXRad2l2VnNVRy9PeEduSjZZUnp4dFNibVBJQnJxbnFZTzh2VGdHYms1Z0tkcHlHZ3JxdDF0RjlCUVl5RVNCVXkvTkVtV2Nmc2JMZDNCdmJjUDI4TFhiazkyU1V1Y3hqcGg3NmtIOHVmNkFVZFdURU94ajRnZEUyRnF6NzdXU2lOemM0MERxN25OSU1KVmhKb2t5UkVaNGlpYzBwOE55VmZCM2lPb2FCWEMyUmRFZWlEZGZBeEZhN0hyclhuSzZiTUFLZ25TaCtMajlPY0Vid05uVy8xdzBORlpFSlVKdjFNVlp1SVUrZjZyT21JckU1UWgyTlFNVGxqcDZ6SXhsQ1I5VW01ZDJHTnV1RUJkYUhRVitINGtTY01BUlJJWnVHRG0yT3dZaFg2bG5mM1I3S1ZodEs1YXJyYS9TZGNEclF2K3hGdDd5a0dUT2VPVDBmd1p5SHV6ZHFnR09sbnRMeFRja2tqWFNWRWdnVW55R0F6NzVCdXRaN3BITGNPQzlpWlFYbTUxNkhyTzBaR2IrWWljNnpZNFRzVlFLRGdESG43bGRrRXhvMHFhSWM0UEx5dC9ZNHVBQU9uYW81ekpveHhqNTFya3pYdTVYZE1WZWdLb1lWUXpydXFlcDFmaER2eVhkeGI4QzRHWFhUN2RabUdCMktJK2Z4Vlh5OWJkK3lYejIvM1BUTmc9PSIsInRhdHNpZCI6ImQ3YWU3ZDZjNzUwNGE0ZThkZmY5ZWNjYjc3Yzg4NzBkIiwiY3NUayI6IjY5NjY1YTEyMjhkNTU3MzcwMmU4Y2RjMjU5ZGU2OGY2MjQ2YTMzY2IiLCJ0b2tlblR5cGUiOiJIQUxPIiwic2lkIjoiNmEwNGIxMDAtM2NmZS00Yzc5LThkMTMtMGJkMjhjMjA3ZmMxIiwiaWF0IjoxNzE5Njk4MzIzLCJleHAiOjE3MTk3MDAxMjN9.EMo-VK6SGquDzrCqLMporx4wRnzBm0ptORrVkyzAKMk; bm_sv=983CFF60ACA7BABDE50DC51D586D04CF~YAAQhgLEF7CXNE6QAQAAl/kBZhgBUgDp9oSKR8oTTYysiak6/XffqB9STR60qc0+PUEqbbERvIMSHt0sC1qO+bLdDGtc3sQ7NflBXuB6Dx2eFntwIxg2qWBnLBNvWJerU1V+JJjK93xxs6Pv5y4UYS60shPnV+68BKVRmXhMeOpI0pVxp13iydWcvw4z9bR++TLwIi67f3o9JUCo8oo5Bdb6dpJfvSooC/hvp8O7ljurg/U9C0eu23z5WP4B/g==~1; rxvt=1719700124648|1719697561292; dtPC=29$98314729_481h55vUANWFANJFTPITNTOIDRUFAGFCTTHCAMK-0e0' \
  --data-raw $PAYLOAD \
  $BASE_URL)

echo $RESPONSE

python3 savePDF.py "$YYYYMM" "$RESP"
