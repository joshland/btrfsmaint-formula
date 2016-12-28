removal:
  pkg.removed:
    - pkgs:
      - btrfs-progs
      
packages:
  pkg.installed:
    - pkgs:
      - libuuid-devel
      - libattr-devel
      - zlib-devel
      - libacl-devel
      - e2fsprogs-devel
      - libblkid-devel
      - lzo2-devel
      - asciidoc
      - xmlto
      - automake

git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git:
  git.latest:
    - user: root
    - target: /usr/src/btrfs-progs

build:
  cmd.run:
    - name: |
        cd /usr/src/btrfs-progs
        make clean
        ./autogen.sh
        ./configure
        make
    - cwd: /usr/src/btrfs-progs
    - shell: /bin/bash
    - timeout: 300
    #- unless: test -x /usr/local/bin/foo

install:
  cmd.run:
    - name: |
        cd /usr/src/btrfs-progs
        make install
    - cwd: /usr/src/btrfs-progs
    - shell: /bin/bash
    - timeout: 300
    - requires:
        - build
