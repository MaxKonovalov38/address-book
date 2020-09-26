#!/usr/bin/perl
use strict;
use warnings;

# function for displayning data in CL
sub watch_contact {
	return 0;
}

# function for adding a contact
sub add_contact {
    my @list_parameter = ();
    system("clear");
    
    print('- Добавить контакт в список -', "\n");
    print('Введите Name: ');
    chomp(my $param_name = <STDIN>);
    print('Введите Last Name: ');
    chomp(my $param_last_name = <STDIN>);
    print('Введите Пол: ');
    chomp(my $param_sex = <STDIN>);
    print('Введите Адрес: ');
    chomp(my $param_address = <STDIN>);
    print('Введите Индекс: ');
    chomp(my $param_index = <STDIN>);
    print('Введите Номер телефона: ');
    chomp(my $param_telephon = <STDIN>);
    
    push(@list_parameter, $param_name, $param_last_name, $param_sex, $param_address, $param_index, $param_telephon);
    
    open(my $fh, '>>', 'data.csv') or die "Can't read file $!\n";
    print $fh "\n";
    print $fh @list_parameter = join(':', @list_parameter);
    close $fh or die "Error $!\n";
}

# function for searching by name
sub search_contact {
    system("clear");
    print "Input name: ";
    chomp(my $search_name = <STDIN>);

    open(my $fh, '<', 'data.csv') or die "Can't read file $!\n";

    my ( $param_name, $param_last_name, $param_sex, $param_address, $param_index, $param_telephon );
    my $found;

    while ( <$fh> ) {
        chomp;
        ( $param_name, $param_last_name, $param_sex, $param_address, $param_index, $param_telephon ) = split( /:/, $_ );

        if ( $param_name eq $search_name ) {
            $found = $.;
            print "Found space: $param_name in line $found\n\n";
            print "Data $param_name ( $param_last_name )\n";
            print "===========", ( "=" x ( length($param_name) + length($param_last_name) + 5) ), "\n";
            print "SEX:  $param_sex\n";
            print "GEO:  $param_address\n";
            print "Total: $param_index, Telephon: $param_telephon\n\n";
        }
    }
    close $fh or die "Error $!\n";
}

### Menu 'Address book' ###
print("-- Адресная книга --\n");
print("- Меню программы -\n");
print("1 - Просмотр\n");
print("2 - Добавить\n");
print("3 - Поиск\n");
print("0 - Выход\n");

print("Выбирите пункт: ");
my $number_menu = <STDIN>;
chomp($number_menu);

### Logic menu ###
if ( $number_menu == 0 ) {
    print("Exit!\n");
    exit;
}
elsif ( $number_menu == 1 ) {
    &watch_contact();
}
elsif ( $number_menu == 2 ) {
    &add_contact();
}
elsif ( $number_menu == 3 ) {
    &search_contact();
}
else {
    print("Variable not found!!\n");
}
