{%- set hostname = grains['id'] -%}

saltinstall:
  minion:
    id: diplomovka-ops
    master: localhost
    master_port: 4506
    publish_port: 4505
    saltenv: common
    state_top_saltenv: common
    default_top: common
    test: false
    logging:
      log_file: /var/log/salt/minion
      log_level: warning
      log_datefmt: '%H:%M:%S'
