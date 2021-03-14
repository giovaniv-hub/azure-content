#!/bin/bash

#set variable sources / target and file parameter

echo "-----------------------------------------------"
echo " Where's the Source files?"
read -p ' -- Source Path Files: ' param_scr_file
echo ""

echo "-----------------------------------------------"
echo " Where do you want to save the files?"
read -p ' -- Target Path Files: ' param_tgt_file
echo ""

echo "-----------------------------------------------"
echo " Where's the parameter file?"
read -p ' -- Parameter Path: ' param_path
read -p ' -- Parameter File Name: ' param_name
echo ""


echo "Preparing the process...."

# create arry spin
spinner=(Ooooo oOooo ooOoo oooOo ooooO)

#------------------------------------------
#---Assing the parameters
#-------------------------------------------
#-- Desc: variable from to configure
#--
#-- filename to $0
#-- srcfiles to $1
#-- tgtfiles to $2
#-------------------------------------------

filename=$param_path/$param_name
srcfiles=$param_scr_file
tgtfiles=$param_tgt_file


#---- Function ----------------------------------------------------------------------------

# function to generate progess bar
spin(){
  while [ 1 ]
  do
    for i in "${spinner[@]}"
     do
     echo -ne "\r$i"
     sleep 0.2
    done
  done
}

# function to convert file type
fn_convert_file(){
  spin &
  pid=$!

  for i in $(cat $0);do
   for f in $(echo "$i" | sed 's/\.[^.]*$//');do
     iconv -f ISO-8859-1 -t UTF-8//TRANSLIT $1/$i -o $2/$f.txt
     echo $i
   done
  done

  kill $pid

}

#--- Start Process ------------------------------------------------------------------------

fn_convert_file $filename $srcfiles $tgtfiles
