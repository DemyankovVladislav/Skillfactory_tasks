Напишите плейбук, который будет на удаленной системе создавать пользователя user1 и задавать ему SSH-ключ (создавая заданный ключ в /home/user1/.ssh/id_rsa.pub). Ключ не должен передаваться в открытом виде. Используйте для шифрования ключа ansible-vault. Ключ можете сгенерировать, используя SSH-keygen.

Создайте плейбук, который устанавливает, либо удаляет почтовый сервер postfix в зависимости от тега.

При запуске ansible-playbook <путь_к_плейбуку> --tags "init postfix" должен устанавливаться и запускаться с конфигурацией по умолчанию. При запуске ansible-playbook <путь_к_плейбуку> --tags drop postfix должен удаляться с машины.

Использовал ubuntu_2204 где установлен ansible, slave centos7.
