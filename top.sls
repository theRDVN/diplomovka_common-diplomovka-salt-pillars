common:
  "my_environment:common":
    - match: grain
    - common.linux-common
  "diplomovka-ops":
    - diplomovka-ops.saltmanage-minion-ops
    - diplomovka-ops.saltmanage-master-ops
    - diplomovka-ops.saltmanage-grains-ops
    - diplomovka-ops.linux-ops