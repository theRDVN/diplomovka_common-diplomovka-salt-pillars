saltinstall:
  grains:
    env: common
    common_services:
      - stackstorm
      - saltmaster
      - saltapi
    saltinfra: 
      - master
    my_environment: common
    testgrain: hello
