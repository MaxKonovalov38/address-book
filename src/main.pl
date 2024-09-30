#!/usr/bin/env perl
use v5.40;
use lib 'Libs';

use AddContact;
use FuncLog;

# Имя файла логгирования
my $logger_file = 'Log/info_text.txt';

# Справка/help
my $data_help = <<EOF;
[Address book] учебная программа

Корректные параметры командной строки
add - Создать
edit - Редактировать
remove - Удалить
search - Поиск

Примеры:
\$\> perl main.pl search
Введите параметр поиска: Коновалов
EOF

# Обработка аргументов командной строки
my @arr_arg_param = ("add", "edit", "remove", "search");
my $arg_param = shift or die "Usage: $0 ARG_PARAMETR\n";

chomp($arg_param);
foreach (@arr_arg_param) {
	if ($arg_param eq $_) {
		FuncLog::logger_file($logger_file, "The command line argument is correcty");
		redo;
	} else {
		FuncLog::logger_file($logger_file, "The command line argument is invalid");
		print($data_help);
		exit;
	}
}