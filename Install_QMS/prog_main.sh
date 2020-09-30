# Main with progress bar

# Liked the idea of using process Id
# Implement later
#/usr/bin/scp me@website.com:file somewhere 2>/dev/null &
#pid=$! # Process Id of the previous running command

#spin='-\|/'

#i=0
#while kill -0 $pid 2>/dev/null
#do
#  i=$(( (i+1) %4 ))
#  printf "\r${spin:$i:1}"
#  sleep .1
#done
