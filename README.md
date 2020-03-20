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

### Конфигурация для подключения дз 3

bastion_IP = 34.77.93.185
someinternalhost_IP = 10.132.0.4

# дз 4
### Конфигурация для подключения
testapp_IP = 34.76.138.59
testapp_port = 9292

### Команда создания виртуалки с предустановленным ПО
 > gcloud compute instances create reddit-app --metadata-from-file startup-script=install.sh --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure

### Команда создания правила-исключения для брандмауэра GCP
> gcloud compute firewall-rules create default-puma-server --network "default" --priority 1000 --direction in --action allow --target-tags puma-server --source-ranges 0.0.0.0/0 --rules TCP:9292 --no-disabled --no-enable-logging
