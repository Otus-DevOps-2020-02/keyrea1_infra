# keyrea1_infra
keyrea1 Infra repository

# Способ подключения к someinternalhost в одну команду через подключение к bastion
ssh -t -A k.cherkasovstolpovsk@34.77.93.185 'ssh k.cherkasovstolpovsk@10.132.0.4'

# Способ подключения в одну команду вида "ssh someinternalhost"
Добавить в .ssh/config настройки с джампом через хост bastion:
>Host bastion
>  HostName 34.77.93.185
>  User <user>
>
>Host someinternalhost
>  HostName 10.132.0.4
>  User <user>
>  ProxyJump bastion

где <user> - имя пользователя локальной машины.

### Конфигурация для подключения

bastion_IP = 35.198.167.169

someinternalhost_IP = 10.132.0.4
