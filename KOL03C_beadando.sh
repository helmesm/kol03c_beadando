#!/bin/bash
curl_function() {
curl -i https://drive.google.com/file/d/11bWJvche1QK2dSCzjmp6zbNSvRDU9cRa/view?usp=sharing -o szoveg.rtf
echo "Letöltés sikeres"
ls
}
file_function() {
echo "Két fájl létrehozva (Autok.rtf, Üzemanyag.rtf)"
printf "Ford\n Porsche\n Ferrari\n Audi\n Alfa Romeo"> Autok.rtf
printf "Benzin\n Dízel\n Hybrid\n Elektromos\n CNG"> Üzemanyag.rtf
}
sz_function() {
fileName=$1
if [[ -f $fileName ]]
then
	echo "Szó amit keresne: "
	read grepvar
	cat $fileName|grep $grepvar
else
	echo "$fileName nem létezik!"
fi
}
help_function() {
echo " -a Autok.rtf megynitása"
echo " -o  Üzemanyagok.rtf megnyitása"
}
while getopts :omhcs:f opt;do
  case $opt in
	a)
		nano Autok.rtf;;
	o)
		nano Üzemanyag.rtf;;
	c)
		curl_function;;
	s)
		sz_function $OPTARG;;
	:)	echo "A kapcsoló várja az értéket: $OPTARG";;
	h)
		help_function;;
	*)
		echo "Nincs ilyen funkció"
	exit ;;
  esac
done
