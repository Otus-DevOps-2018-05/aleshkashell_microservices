# aleshkashell_microservices    [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/aleshkashell_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2018-05/aleshkashell_microservices)
aleshkashell microservices repository

# Table of content
- [Docker 1](#docker-1) [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/aleshkashell_microservices.svg?branch=docker-1)](https://travis-ci.com/Otus-DevOps-2018-05/aleshkashell_microservices)
- [Docker 2](#docker-2) [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/aleshkashell_microservices.svg?branch=docker-2)](https://travis-ci.com/Otus-DevOps-2018-05/aleshkashell_microservices)
- [Docker 3](#docker-3) [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/aleshkashell_microservices.svg?branch=docker-3)](https://travis-ci.com/Otus-DevOps-2018-05/aleshkashell_microservices)

# Docker 1

## 1. Что было сделано
- Установлены docker, docker-compose, docker-machine
- Рассмотрена работа с конетейнерами и образами
- Сохранен вывод команды docker images
- Описано отличие образа от конетейнера
- Добавлена интеграция с travis

## 2. Данные для проверки
- Содержимое файла docker-1.log

# Docker 2

## 1. Что было сделано
- Создан новый проект GCE
- Рассмотрена работа docker-machine с удаленными сервисами
- Произведена сборка docker образа и его запуск в GCE
- Образ залин на docker hub
- Созданы и описаны прототипы создания инфраструктуры с помощью terraform, ansible, packer

## 2. Как запустить проект
```
docker run --name reddit -d -p 9292:9292 aleshkashell/otus-reddit:1.0
```

## 3. Как проверить
- http://127.0.0.1:9292

# Docker 3

## 1. Что было сделано
- Созданы Dockerfile для компонентов приложения
- Произведены сборка и запуск приложения, проверена его работоспособность
- Проверена работа приложения с другими сетевыми алиасами контейнеров
- Образ UI пересобран на основе alpine
- Создан и использован volume

## 2. Как запустить проект
```
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db  -v reddit_db:/data/db  mongo:latest
docker run -d --network=reddit --network-alias=post aleshkashell/post:1.0
docker run -d --network=reddit --network-alias=comment aleshkashell/comment:1.0
docker run -d --network=reddit -p 9292:9292 aleshkashell/ui:3.0
```

## 3. Как проверить
- http://'docker-host-ip':9292
