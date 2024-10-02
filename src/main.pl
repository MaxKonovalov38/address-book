#!/usr/bin/env perl
use v5.40;
use lib 'Libs';

use AddContact;
#use EditContact;
#use DeleteContact;
#use SearchContact;
use FuncLog;

# Имя файла логгирования
my $logger_file = 'Log/info_text.txt';
# Имя файла хранения контактов
my $db_text = 'DB/db_text.txt';

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

sub fun_selection($arg_param, $db_text) {
	if ($arg_param) eq 'add' {pass}
	elsif ($arg_param) eq 'edit' {pass}
	elsif ($arg_param) eq 'remove' {pass}
	else {pass}
}


sub main($logger_file, $data_help) {
    # Обработка аргументов командной строки
    my $arg_param = shift or die $data_help;
    chomp($arg_param);

    # Проверка аргумента на валидность.
    my @arr_arg_param = ("add", "edit", "remove", "search");
    foreach (@arr_arg_param) {
	    if ($arg_param eq $_) {
		    FuncLog::logger_file($logger_file, "The command line argument is correcty");
		    &fun_selection($arg_param);
		    exit;
	    } else {
		    FuncLog::logger_file($logger_file, "The command line argument is invalid");
	    }
	    print($data_help);
	    exit;
    }
}

&main($logger_file, $data_help);

__END__