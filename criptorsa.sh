if [ "$1" == "" ]
then 
    echo "manca il selettore: 1 = zip, 2 = unzip"
    exit 0
fi
if [ "$2" == "" ]
then 
    echo "manca il file da zippare"
    exit 0
fi
if [ "$3" == "" ]
then 
    echo "manca la chiave"
    exit 0
fi




if [ "$1" == "1" ] 
then 
    echo "Comando cripta file lungo"
    openssl rand -out password.dat 32
    openssl enc -e -in $2 -out $2.enc -kfile password.dat -aes256
    openssl pkeyutl -encrypt -inkey $3 -pubin -in password.dat -out password.dat.enc
    zip $2.zip password.dat.enc $2.enc
    rm password.dat $2.enc password.dat.enc
    mv $2 ./originale/
fi
if [ "$1" == "2" ] 
then 
    echo "Comando decripta file lungo"
    unzip $2
    nome="$2"
    fileName=${nome%.*}
    echo $fileName
    openssl pkeyutl -decrypt -inkey $3 -in password.dat.enc -out password.dat
    openssl enc -d -in $fileName.enc -out $fileName -kfile password.dat -aes256
    rm password.dat $fileName.enc password.dat.enc
fi
