# Решение домашнего задания к занятию «Организация сети»
https://github.com/netology-code/clopro-homeworks/blob/main/15.1.md

## Создание бакета, загрузка картинки
### Картинка доступна по адресу https://storage.yandexcloud.net/pkostua-20250409/image.jpg
![image](https://github.com/user-attachments/assets/d91cc5df-b9e2-4230-9e98-2cf8a28e24ba)


## Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать image_id = fd827b91d99psvq5fjit.
Для создания стартовой веб-страницы рекомендуется использовать раздел user_data в meta_data.
Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
Настроить проверку состояния ВМ.

### Состояние облака после применения
ВМ  
![image](https://github.com/user-attachments/assets/4dad20c2-7f38-4f8c-83d8-325163325167)  
Балансировщик  
![image](https://github.com/user-attachments/assets/deb4f01b-cabc-4398-a9c7-8f7c59c0f486)  
Проверка доступности приложения  
![image](https://github.com/user-attachments/assets/0bd95a40-1318-4b63-92d8-2f3a78b37f59)




