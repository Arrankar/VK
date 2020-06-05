# VK Project
## Краткое описание
Проект представляет собой клиент социальной сети "ВКонтакте". Данный проект является одним из курсовых проектов во время 
обучения в GeekBrains University. Обновление происходит еженедельно, по мере изучения новых тем.
## Подробное описание
### Друзья
  После авторизации в сети "ВКонтакте" осуществляется переход на экран, на котором отображены друзья пользователя. 
Отображение друзей происходит анимированно. Так же присутствует анимация при нажатии на аватар друга. На данном экране так же присутствует кастомная анимированная строка поиска, через которую происходит поиск по имени и фамилии друзей. При нажатии на ячейку друга выполняется анимированный переход на следующий экран, на котором отображаются фотографии выбранного друга. Для скроллинга фото используется анимированное переключение одного изображения.

![alt text](https://sun1-85.userapi.com/01-fJh-VY4GEHvHqhAEPHt4UH0TadhR2OCTBbw/Jvi91Up0ChY.jpg)

### Группы
  Вторая вкладка на TabBar это группы пользователя. При нажатии на "+" происходит переход на экран, где через UISearchBar
осуществялетя поиск по группам сети "Вконтакте".

![alt text](https://sun1-47.userapi.com/rN7uaosW_h3eTKClTaPGVeKrb7DSstfASCGCGA/SaXv-cf9Kvc.jpg)

### Новости
  Третья вкладка это Новости пользователя. Она находится в процессе разработки. Планируется выводить полноценную ленту новостей включающую себя текст новости, изображения, дату, источник, кол-во лайков, репостов, просмотров. На данный момент 
готов шаблон ячейки и парсинг текста новости.

## Используемые инструменты

При создании данного проекта использовались следующие инструменты :

- UIKit
  + UITableView
  + UICollectionView
  + UITabbar
  + UINavigationController
  + UISearchBar
  + UIImage
  + UILabel
  
- AutoLayout
- Работа с API ВКонтакте
- ALamofire
- Codable Protocol
- Realm
- Firebase
- CoreAnimation


Сслыка на другой проект: [Exchanger](https://github.com/Arrankar/Examples)
