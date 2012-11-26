#!/bin/sh
# Regenerate PHPMailer documentation
rm -rf phpdocs/*
phpdoc -f ../class.phpmailer.php -f ../class.pop3.php -f ../class.smtp.php --target ./phpdoc --ignore test/,examples/,extras/,test_script/ --sourcecode --force --title PHPMailer
