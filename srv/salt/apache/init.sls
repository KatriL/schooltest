#This init.sls file's code is  from Tero Karvinen's homesite http://terokarvinen.com/2018/apache-user-homepages-automatically-salt-package-file-service-example (Tero Karvinen 2018)#

apache2:
  pkg.installed

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
