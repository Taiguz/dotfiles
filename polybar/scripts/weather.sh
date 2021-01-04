#!/bin/bash
url="https://weather.com/pt-BR/clima/hoje/l/63e18eea74a484c42c3921cf52a8fec98113dbb13f6deb7c477b2f453c95b837"
temp=`curl -silent "$url" | hxnormalize -x | hxselect 'span.CurrentConditions--tempValue--3KcTQ' | cut -d'>' -f2 | cut -d'<' -f1`
echo " $temp"
