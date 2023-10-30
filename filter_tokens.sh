#!/bin/bash
# vars
read -p 'Path to needed folder. Example "/root/100accs": ' file_path
all_acc=${file_path}/accounts.txt
registred_acc=${file_path}/registered.txt
emty_acc=${file_path}/empty_attempts.txt

#filter registred_acc
cat $registred_acc | cut -f 1 -d ';' > ${file_path}/filter_registered.txt
filter_registred_acc=${file_path}/filter_registered.txt

#filter vs 2 files
grep -vf $all_acc $filter_registred_acc | sort -u > ${file_path}/without_registerd.txt
grep -vf ${file_path}/without_registerd.txt $emty_acc | sort -u > ${file_path}/without_registerd_and_emty.txt

echo 'Done'
