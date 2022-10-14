Репозиторий для сдачи заданий SkillFactory

Комадны сборки и запуска приложения:

docker build . -t test

#Скрипт (наше приложение) требует два параметра NAME-имя скаченного лого и URL-сайт откуда надо скачать

docker run --rm -it -v my-vol:/images/src/ -e NAME=skill3 -e URL=https://lms.skillfactory.ru/favicon.ico test (используем volume для хранения логотипов)
