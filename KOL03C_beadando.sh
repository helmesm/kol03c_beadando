#!/bin/bash
curl_function() {
curl https://cat-fact.herokuapp.com/facts -o response.json
}
szures_function(){
if [ ! -f response.json ]
then
echo "Nem létezik a fájl"
exit
fi
number=$(cat response.json | jq ".| length")
for i in $(seq 0 1 $(($number-1)))
do
cat response.json | jq .[$i].text | tr -d \\\"
done
}
help_function(){
cat << END
$0 [opciók]

c Macskák érdekességeinek letöltése
s Szűrés
h Segítség

END
}
while getopts :hcs opt;do
  case $opt in
	c)
		curl_function;;
	s)
		szures_function;;
	h)
		help_function;;
	*)
		echo "Nincs ilyen funkció"
	exit ;;
  esac
done
