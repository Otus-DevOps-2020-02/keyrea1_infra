# keyrea1_infra
keyrea1 Infra repository

# дз 2
### Способ подключения к someinternalhost в одну команду через подключение к bastion
ssh -t -A k.cherkasovstolpovsk@34.77.93.185 'ssh k.cherkasovstolpovsk@10.132.0.4'

### Способ подключения в одну команду вида "ssh someinternalhost"
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

# дз 3
### Конфигурация для подключения

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

# дз 5
### Команда создания виртуалки - задание со звездочкой:
 > gcloud compute instances create reddit-app-full --boot-disk-size=10GB --image-family reddit-full --machine-type=g1-small --tags puma-server --restart-on-failure

# дз 8
### Был добавлен ssh ключ appuser_web, но он был удален после команды terraform apply

### Был создан балансировщик нагрузки (файл lb.tf). Настроены выводы 3 ip адресов в output.tf Реализована работа со счетчиком с дефолтным значением 1 с помощью переменной count. После этого для корректной работы приходится изменять файлы lb.tf, outputs.tf и main.tf.
