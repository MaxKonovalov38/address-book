package AddContact;
use strict;
use warnings;
our @EXPORT_OK = ('add_contact');
 
sub add_contact {
    my @list_parameter = ();
    system("clear");
    
    print('- Добавить контакт в список -', "\n");
    print('Введите имя: ');
    chomp(my $param_name = <STDIN>);
    print('Введите фамилию: ');
    chomp(my $param_last_name = <STDIN>);
    print('Введите возвраст: ');
    chomp(my $param_age = <STDIN>);
    print('Введите пол: ');
    chomp(my $param_sex = <STDIN>);
    print('Введите город проживания: ');
    chomp(my $param_city = <STDIN>);
    print('Введите почтовый индекс: ');
    chomp(my $param_index = <STDIN>);
    print('Введите номер телефона: ');
    chomp(my $param_telephon = <STDIN>);

    push(@list_parameter,
        $param_name,
        $param_last_name,
        $param_age,
        $param_sex,
        $param_city,
        $param_index,
        $param_telephon);

    return @list_parameter;
}

1;

__END__