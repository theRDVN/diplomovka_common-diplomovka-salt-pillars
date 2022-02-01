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
      base:
        - /opt/salt/base/artifacts
        - /opt/salt/base/formulas/salt-formula-spring-boot
        - /opt/salt/base/formulas/salt-formula-wls
        - /opt/salt/base/formulas/salt-formula-iptables
        - /opt/salt/base/formulas/salt-formula-camunda
        - /opt/salt/base/formulas/salt-formula-liquibase
        - /opt/salt/base/formulas/salt-formula-java
        - /opt/salt/base/formulas/salt-formula-linux-new
        - /opt/salt/base/formulas/salt-formula-jboss-fuse
        - /opt/salt/base/formulas/salt-formula-mock
        - /opt/salt/base/formulas/salt-formula-consul
        - /opt/salt/base/formulas/salt-formula-firewalld
    pillar_roots:
      common:
        - /opt/salt/common/pillars
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
        "git@git.posam.sk:ris-ng-deploy/pillars/shared-all-salt-pillars.git":
          env: all
          branch: staging
        "git@git.posam.sk:ris-ng-deploy/artifacts/psm-salt-cert-store.git":
          env: all
          branch: master
        "master git@git.posam.sk:ris-ng-common/common-psm-salt-pillars.git":
          env: common
    gitfs_remotes:
      "git@git.posam.sk:ris-ng-common/common-psm-salt-files.git":
        saltenv: 
          common:
            branch: master
            mountpoint: salt://files
      "git@git.posam.sk:ris-ng-deploy/artifacts/shared-all-salt-files.git":
        saltenv:
          common:
            branch: master
            mountpoint: salt://files
          dev:
            branch: staging
            mountpoint: salt://files
          edu:
            branch: staging
            mountpoint: salt://files
          perf:
            branch: staging
            mountpoint: salt://files
          int:
            branch: staging
            mountpoint: salt://files

  salt-api:
    port: 8056
    ssl_crt: /etc/ssl/st2/st2.crt
    ssl_key: /etc/ssl/st2/st2.key

