#!/bin/bash
# Získa všetky parametre
hladam="$@"
# medzera preč, namiesto toho + 
Uphladam="$(echo "$hladam" | tr ' ' '+')"

html=$(curl -s "https://arxiv.org/search/?query=$Uphladam&searchtype=all&abstracts=show")

# Predspracovanie: odstránenie nových riadkov a zmena < na newline
Uphtml=$(echo "$html" | tr -d '\n' | tr '<' '\n')
# tie riadky čo majú abs
#od čokolvek predtym (.*), po abs, zachyti, preskoci vsetko pred abs, vratane 
#zachyti to, čo je v "", zachyti znaky, ktore nie su ""
codes=$(echo "$Uphtml" | grep '/abs/' | sed 's/.*\/abs\/\([^"]*\).*/\1/')

# len unikátne, sortovane 
vycistene=$(echo "$codes" | sort | uniq)
echo "$vycistene"

#https://arxiv.org/search/?query=Terence+Tao+Erdos&searchtype=all&source=header