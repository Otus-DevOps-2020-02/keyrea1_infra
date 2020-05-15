# keyrea1_infra
Кирилл Черкасов-Столповских Infra repository

Очерендность описания домашек: внизу readme самая последняя

# дз 2
#### Способ подключения к someinternalhost в одну команду через подключение к bastion
ssh -t -A k.cherkasovstolpovsk@34.77.93.185 'ssh k.cherkasovstolpovsk@10.132.0.4'

#### Способ подключения в одну команду вида "ssh someinternalhost"
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
#### Конфигурация для подключения

bastion_IP = 34.77.93.185

someinternalhost_IP = 10.132.0.4

# дз 4
#### Конфигурация для подключения

testapp_IP = 34.76.138.59

testapp_port = 9292

#### Команда создания виртуалки с предустановленным ПО
 > gcloud compute instances create reddit-app --metadata-from-file startup-script=install.sh --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure

#### Команда создания правила-исключения для брандмауэра GCP
> gcloud compute firewall-rules create default-puma-server --network "default" --priority 1000 --direction in --action allow --target-tags puma-server --source-ranges 0.0.0.0/0 --rules TCP:9292 --no-disabled --no-enable-logging

# дз 5
#### Команда создания виртуалки - задание со звездочкой:
 > gcloud compute instances create reddit-app-full --boot-disk-size=10GB --image-family reddit-full --machine-type=g1-small --tags puma-server --restart-on-failure

# дз 8
Был добавлен ssh ключ appuser_web, но он был удален после команды terraform apply

Был создан балансировщик нагрузки (файл lb.tf). Настроены выводы 3 ip адресов в output.tf Реализована работа со счетчиком с дефолтным значением 1 с помощью переменной count. После этого для корректной работы приходится изменять файлы lb.tf, outputs.tf и main.tf.

# дз 9
Была импортирована текущая инфрастуктура в Terraform(правила фаервола), проверена работа зависимостей, структурированы ресурсы, конфигурация разбита на файлы, проект разбит на модули. Созданы stage и prod версии проекта с использованием модулей. Произведена работа с реестром модулей, устанавлен модуль для Баккета
Также был перенесен стейт на удаленный бэкэнд с файлом backend.ts, проверена работа блокировок и уделенного стейта, настроены провиженеры для разворачивания приложения (использован terraform template)

#дз 10
Был создан файл inventory
Произведена работа с группой хостов
Знакомство с модулями
Написан простой плейбук
Строчка
> PLAY RECAP ok= - сколько задач выполнено
changed= - сколько задач произвели изменения в системе

Написан python-скрипт для работы с динамическим инвентори:
на выходе выдает json формат.
Скрипт dynamic-inv.py:
1. Заходит в gcp
2. Парсит имена хостов и ip адреса
3. Выдает форматированный json

#дз 11
Были рассмотрены вырианты создания инфрструктуры с помощью плейбуков (один файл может задавать группы хостов к которым будет применяться этот файл через --limit и через теги --tags задания)
Расмотрен вариант, когда в одном плейбуке лежит несколько сценариев (указаны только теги, нужные группы уже заложены в сценариях)
Рассмотрен вариант с несколькими плейбуками (самый оптимальный)
Переписан скрипт для создания динамического инвентори (теперь на выходе json c разбивкой пр группам)
Вместо shell скриптов в packer теперь используется ansible для установки пакетов
Документация по модулям: https://docs.ansible.com/ansible/latest/modules/list_of_all_modules.html
Документация по циклам: https://docs.ansible.com/ansible/latest/user_guide/playbooks_loops.html
Команда для запуска плейбука на хостах входящих в группу db выполняются только задачи с тегом app-tag (--check тестовый прогон плейбука): "ansible-playbook reddit_app.yml --check --tags app-tag --limit db"
Корректные пути в JSON-файлах, билд образов нужно производить из корня репозитория
Пользователь для WSL "user": "appuser"
