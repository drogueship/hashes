#!/bin/bash

outfile=$cypher".txt"
outpath="/share/Documents/project/hashes/output/$cypher/"
logfile=$outpath$outfile
cypher=$1

if [ -o $cypher ];then
	exit "type in your hashing handler you hoppig hangry hopefull"
fi

if [ ! -d "$outpath" ]; then
	mkdir $outpath
fi

charset=( '' {0..9} {a..z} {A..Z} '`' '-' '=' '[' ']' '\' ';' "'" ',' '.' '/' '~' '!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '_' '+' '{' '}' '|' ':' '"' '<' '>' '?' )
charlen=94
charcount=0
if [ -a $outpath$outfile ];then
	charray=( `tail -n1 $logfile | cut -d ' ' -f2` `tail -n1 $logfile | cut -d ' ' -f3` `tail -n1 $logfile | cut -d ' ' -f4` `tail -n1 $logfile | cut -d ' ' -f5` `tail -n1 $logfile | cut -d ' ' -f6` `tail -n1 $logfile | cut -d ' ' -f7` `tail -n1 $logfile | cut -d ' ' -f8` `tail -n1 $logfile | cut -d ' ' -f9`)
	((charray[7]++))
else
	charray=( 0 0 0 0 0 0 0 0 )
fi
for ((${charray[0]};${charray[0]} < 95; ((charray[0]++)) ))
{
 for ((${charray[1]};${charray[1]} < 95; ((charray[1]++)) ))
 {
  for ((${charray[2]};${charray[2]} < 95; ((charray[2]++)) ))
  {
   for ((${charray[3]};${charray[3]} < 95; ((charray[3]++)) ))
   {
    for ((${charray[4]};${charray[4]} < 95; ((charray[4]++)) ))
    {
     for ((${charray[5]};${charray[5]} < 95; ((charray[5]++)) ))
     {
      for ((${charray[6]};${charray[6]} < 95; ((charray[6]++)) ))
       {
        for ((${charray[7]};${charray[7]} < 95; ((charray[7]++)) ))
	{
		currentstring="${charset[${charray[0]}]}${charset[${charray[1]}]}${charset[${charray[2]}]}${charset[${charray[3]}]}${charset[${charray[4]}]}${charset[${charray[5]}]}${charset[${charray[6]}]}${charset[${charray[7]}]}"
		hash=`echo -n $currentstring | $cypher | tr -d "[:space:]-"`
		echo "$charcount ${charray[*]} $currentstring $hash" | tee $logfile
		((charcount++))
	}
	charray[7]=1
       }
       charray[6]=1
      }
      charray[5]=1
     }
     charray[4]=1
    }
    charray[3]=1
   }
   charray[2]=1
  }
  charray[1]=1
 }
 charray[0]=1
}
echo "there was rejoicing amongst the people"
