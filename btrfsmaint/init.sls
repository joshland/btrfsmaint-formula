packages:
  pkg.installed:
    - pkgs:
      - btrgs-progs

docopt:
  pip.installed: []

https://github.com/joshland/btrfsmaint.git:
  git.latest:
    - user: root
    - target: /usr/src/btrfsmaint

/usr/local/bin/btrfsmaint:
  file.managed:
    - user:  root
    - group: root
    - mode:  '0755'
    - source: /usr/src/btrfsmaint/btrfsmaint.py

