#!/bin/bash


display_usage() {
  echo -e "error: invalid arguments"
  echo -e "usage: $0 block [site]"
  echo -e "   or: $0 unblock [site]"
  echo -e ""
  echo -e "    site (optional)        leave empty to operate on all your distracting sites"
  echo -e "                           or use specific site, for example, facebook.com"
}

# first argument should be either block or unblock
if [ "$1" != "block" ] && [ "$1" != "unblock" ]; then
  display_usage
  echo -e "\n$1\n"
  exit 1
fi

# block all
if [ "$1" == "block" ] && [ "$2" == "" ]; then
  ansible-playbook focus-love.yml -K --extra-vars="user_action=block"
fi

# block specific supplied
if [ "$1" == "block" ] && [ "$2" != "" ]; then
  ansible-playbook focus-love.yml -K --extra-vars="user_input_distracting_site=$2 user_action=block"
fi

# unblock all
if [ "$1" == "unblock" ] && [ "$2" == "" ]; then
  ansible-playbook focus-love.yml -K --extra-vars="user_action=unblock"
fi

# unblock specific supplied
if [ "$1" == "unblock" ] && [ "$2" != "" ]; then
  ansible-playbook focus-love.yml -K --extra-vars="user_input_distracting_site=$2 user_action=unblock"
fi

echo " works"
exit 0