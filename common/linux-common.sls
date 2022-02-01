linux:
  system:
    enabled: true
    timezone: Europe/Bratislava
    environment: dev
    selinux: disabled
    kernel:
      sysctl:
        net.ipv4.tcp_keepalive_time: 3600
    bash:
      preserve_history: false
    sudo:
      enabled: true
      requiretty: false
      users:
        zabbix:
          hosts:
          - ALL
          commands:
          - /usr/bin/salt-call grains.item env my_environment kernel
    prompt:
      default: \\[\\e[1;31m\\][\\u@\\h:\\w]\\[\\e[0m\\]
    package:
      salt-minion:
        version: latest
      mc:
        version: latest
      vim-common:
        version: latest
      wget:
        version: latest
      telnet:
        version: latest
      # bind-utils:
      #   version: latest
      bzip2:
        version: latest
      net-tools:
        version: latest
      bash-completion:
        version: latest
      dos2unix:
        version: latest
    locale:
      en_US.UTF-8:
        enabled: true
        default: true
      "cs_CZ.UTF-8 UTF-8":
        enabled: true

