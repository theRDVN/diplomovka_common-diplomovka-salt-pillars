{%- set hostname = grains['id'] -%}

saltinstall:
  master:
    is_syndic: false
    publish_port: 4505
    ret_port: 4506
    set_gpg: True
    order_masters: true
    state_events: False
    output:
      show_timeout: true
      show_jid: True
      color: True
      strip_colors: False
      cli_summary: True
      output: highstate
    performance:
      worker_threads: 20
      salt_event_pub_hwm: 20000
      event_publisher_pub_hwm: 10000
      timeout: 25
    logging:
      log_file: /var/log/salt/master
      log_level: warning
      log_datefmt: '%H:%M:%S'
    file_roots:
      common:
        - /opt/salt/common/artifacts
        - /opt/salt/common/states
        - /opt/salt/formulas/diplomovka_salt-formula-linux
        - /opt/salt/formulas/diplomovka_salt-formula-saltmanage
        - /opt/salt/states/diplomovka_shared-all-salt-states
      base:
        - /opt/salt/base/artifacts
        - /opt/salt/base/states
        - /opt/salt/formulas/diplomovka_salt-formula-linux
        - /opt/salt/formulas/diplomovka_salt-formula-saltmanage
        - /opt/salt/states/diplomovka_shared-all-salt-states
    pillar_roots:
      common:
        - /opt/salt/common/pillars
      base:
        - /opt/salt/base/pillars
    sudo_acl: False
    publisher_acl:
      stackstorm:
        "allhosts":
          - .*
    external_auth:
      pam:
        stackstorm:
          - '@runner'
          - '.*'
          - '@wheel'
          - '@jobs'
    fileserver_backend:
      - git
      - roots
    gitfs_set:
      git_pillar_provider: pygit2
      git_pillar_ssl_verify: False
      git_pillar_privkey: '/root/.ssh/id_rsa_git'
      git_pillar_pubkey: '/root/.ssh/id_rsa_git.pub'
      git_pillar_global_lock: False
      gitfs_global_lock: False
      gitfs_update_interval: 120
      gitfs_provider: pygit2
      gitfs_ssl_verify: False
      gitfs_privkey: '/root/.ssh/id_rsa_git'
      gitfs_pubkey: '/root/.ssh/id_rsa_git.pub'
    ext_pillar:
      git:
        "https://github.com/theRDVN/diplomovka_base-diplomovka-salt-pillars.git":
          env: base
          branch: master
        "https://github.com/theRDVN/diplomovka_common-diplomovka-salt-pillars.git":
          env: all
          branch: master

  salt-api:
    port: 8056
    ssl_crt: /etc/ssl/st2/st2.crt
    ssl_key: /etc/ssl/st2/st2.key