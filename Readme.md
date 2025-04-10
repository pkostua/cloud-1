# Решение домашнего задания к занятию «Вычислительные мощности. Балансировщики нагрузки»
https://github.com/netology-code/clopro-homeworks/blob/main/15.2.md


## Создание бакета, загрузка картинки
Код здесь https://github.com/pkostua/cloud-1/blob/cloud-2/s3.tf

### Картинка доступна по адресу https://storage.yandexcloud.net/pkostua-20250409/image.jpg
![image](https://github.com/user-attachments/assets/d91cc5df-b9e2-4230-9e98-2cf8a28e24ba)



## Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

### Создание Instance Group, настойка проверок
https://github.com/pkostua/cloud-1/blob/cloud-2/lamp-group.tf  

### Создание веб станицы с картинкой
https://github.com/pkostua/cloud-1/blob/cloud-2/template/lamp-cloud-init.yml

### Состояние облака после применения
ВМ  
![image](https://github.com/user-attachments/assets/4dad20c2-7f38-4f8c-83d8-325163325167)  
Балансировщик  
![image](https://github.com/user-attachments/assets/deb4f01b-cabc-4398-a9c7-8f7c59c0f486)  
Проверка доступности приложения  
![image](https://github.com/user-attachments/assets/0bd95a40-1318-4b63-92d8-2f3a78b37f59)




## Подключить группу к сетевому балансировщику:

### Создать сетевой балансировщик.
https://github.com/pkostua/cloud-1/blob/cloud-2/nlb.tf

### Проверить работоспособность, удалив одну или несколько ВМ.
Остановили 2 ВМ из трех
![image](https://github.com/user-attachments/assets/ba1ba386-88d2-4d8f-a9b3-e5703d43a514)  
В группе балансировки осталась 1 ВМ  
![image](https://github.com/user-attachments/assets/406f2ecc-e8e6-459b-b433-ba37685b22d0)  
Пока не опомнился наблюдатель, быстро проверяем доступность
![image](https://github.com/user-attachments/assets/04e26a5d-78b4-4fd9-9837-56bee747157e)  
Доступ есть





