# Решение домашнего задания к занятию «Организация сети»
https://github.com/netology-code/clopro-homeworks/blob/main/15.1.md

## Состояни инфраструктуры после применения
### ВМ
![image](https://github.com/user-attachments/assets/2eaa701f-cc65-4aca-8a23-5a8cfff44306)
### Сеть
![image](https://github.com/user-attachments/assets/628e00e0-bca2-459a-ab07-2fdf561e8a96)

### Подключаемся к ВМ из приватной сети
```
host vm-private
    Port 22
    User ubuntu
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    HostName 192.168.20.20
    IdentityFile ~/.ssh/id_ed25519
    ProxyCommand ssh -W %h:%p bastion

host bastion
    Port 22
    User ubuntu
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    HostName 89.169.150.84
    IdentityFile ~/.ssh/id_ed25519
```

### Проверяем доступ в интернет
![image](https://github.com/user-attachments/assets/36f83cee-6da0-48e6-a4d6-e39b47bde5ce)

### Основня работа терраформа здесь
https://github.com/pkostua/cloud-1/blob/master/main.tf

