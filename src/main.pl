#!/usr/bin/perl
use strict;
use warnings;

use DBI;
use 5.010;

use lib 'Libs';
use FuncLog;
use AddContact;

# Имя файла логгирования
my $logger_file = 'Log/info_text.txt';

# Подключение к драйверу БД
my $driver = "SQLite";
my $database = "DB/ad_book.db";
my $dsn = "DBI:$driver:dbname=$database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
	or die $DBI::errstr;
FuncLog::logger_file($logger_file, "Opened database successfully");

### Menu 'Address book' ###
my $menu_data = <<EOF;
-- Адресная книга --
- Меню программы -
 1 - Просмотр
 2 - Добавить
 3 - Изменить
 4 - Удалить
 5 - Поиск
---------
0 - Выход
EOF

sub main {
	my $banner = shift;

	print($banner, "\nВыбирите пункт: ");
	my $number_menu = <STDIN>;
	chomp($number_menu);

	given ($number_menu) {
		when (1) {print 1}
		when (2) {
			my @arr = AddContact::add_contact();
			my $stmt = qq(INSERT INTO CONTACTS (NAME,LAST_NAME,AGE,SEX,ADDRESS,INDEX_AD,NUMBER_PHONE)
				VALUES (\'$arr[0]\',\'$arr[1]\',$arr[2],\'$arr[3]\',\'$arr[4]\',$arr[5],$arr[6]));
			my $rv = $dbh->do($stmt) or die $DBI::errstr;
			FuncLog::logger_file($logger_file, "Records created successfully");
			exit;
		}
		when (3) {print 3}
		when (4) {print 4}
		when (5) {print 5}
		when (0) {exit}
		default { print "bug"}
	}
}


&main($menu_data);
$dbh->disconnect();


__END__

# Создание таблицы
my $stmt = qq(CREATE TABLE CONTACTS (
        NAME TEXT NOT NULL,
        LAST_NAME TEXT NOT NULL,
        AGE INT NOT NULL,
        SEX CHAR(1),
        ADDRESS CHAR(50),
        INDEX_AD INT NOT NULL,
        NUMBER_PHONE INT NOT NULL););

my $rv = $dbh->do($stmt);
if ( $rv < 0 ) {
    FuncLog::logger_file($logger_file, $DBI::errstr);
}
else {
    FuncLog::logger_file($logger_file, "Table created successfully");
}