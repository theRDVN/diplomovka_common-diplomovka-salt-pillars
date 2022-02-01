linux:
  system:
    banner:
      enabled: true
      contents: |
        UNAUTHORIZED ACCESS TO THIS SYSTEM IS PROHIBITED

        You must have explicit, authorized permission to access or configure this
        device. Unauthorized attempts and actions to access or use this system may
        result in civil and/or criminal penalties.
        All activities performed on this system are logged and monitored.
    motd:
      - release: |
          #!/bin/sh
          [ -r /etc/lsb-release ] && . /etc/lsb-release

          if [ -z "$DISTRIB_DESCRIPTION" ] && [ -x /usr/bin/lsb_release ]; then
            # Fall back to using the very slow lsb_release utility
            DISTRIB_DESCRIPTION=$(lsb_release -s -d)
          fi

          printf "Welcome to %s (%s %s %s)\n" "$DISTRIB_DESCRIPTION" "$(uname -o)" "$(uname -r)" "$(uname -m)"
      - warning: |
          #!/bin/sh

          printf "'########::'####:'########::'##::::::::'#######::'##::::'##::'#######::'##::::'##:'##:::'##::::'###::::\n"
          printf " ##.... ##:. ##:: ##.... ##: ##:::::::'##.... ##: ###::'###:'##.... ##: ##:::: ##: ##::'##::::'## ##:::\n"
          printf " ##:::: ##:: ##:: ##:::: ##: ##::::::: ##:::: ##: ####'####: ##:::: ##: ##:::: ##: ##:'##::::'##:. ##::\n"
          printf " ##:::: ##:: ##:: ########:: ##::::::: ##:::: ##: ## ### ##: ##:::: ##: ##:::: ##: #####::::'##:::. ##:\n"
          printf " ##:::: ##:: ##:: ##.....::: ##::::::: ##:::: ##: ##. #: ##: ##:::: ##:. ##:: ##:: ##. ##::: #########:\n"
          printf " ##:::: ##:: ##:: ##:::::::: ##::::::: ##:::: ##: ##:.:: ##: ##:::: ##::. ## ##::: ##:. ##:: ##.... ##:\n"
          printf " ########::'####: ##:::::::: ########:. #######:: ##:::: ##:. #######::::. ###:::: ##::. ##: ##:::: ##:\n"
          printf "........:::....::..:::::::::........:::.......:::..:::::..:::.......::::::...:::::..::::..::..:::::..::\n"
          printf ":'#######::'########:::'######::\n"                                                          
          printf "'##.... ##: ##.... ##:'##... ##:\n"                                                          
          printf " ##:::: ##: ##:::: ##: ##:::..::\n"                                                          
          printf " ##:::: ##: ########::. ######::\n"                                                          
          printf " ##:::: ##: ##.....::::..... ##:\n"                                                          
          printf " ##:::: ##: ##::::::::'##::: ##:\n"                                                          
          printf ". #######:: ##::::::::. ######::\n"                                                          
          printf ":.......:::..::::::::::......:::\n"                                                          
          printf "This is Common enviroment for Radovan Pieter's thesis.\n"
          printf "This server provide following services:\n"
          printf " - StackStorm\n"
          printf " - Salt-api\n"
          printf " - Salt-master\n"
          printf " - Salt-minion\n"
          printf "Unauthorized access strictly prohibited.\n\n\n"
    package:
      salt-master:
        version: latest
      salt-api:
        version: latest
      salt-ssh:
        version: latest

