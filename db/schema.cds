namespace my.bookshop;
using { Currency, managed, sap } from '@sap/cds/common';

entity Books : managed {
    key ID       : Integer                @title : 'Código';
        title    : localized String(111)  @title : 'Título';
        descr    : localized String(1111) @title : 'Descrição';
        author   : Association to Authors @title : 'Autor';
        stock    : Integer                @title : 'Estoque';
        price    : Decimal(9, 2)          @title : 'Preço';
        currency : Currency               @title : 'Moeda';
}

entity Authors : managed {
    key ID           : Integer     @title : 'Código Author';
        name         : String(111) @title : 'Nome';
        dateOfBirth  : Date        @title : 'Data de Nascimento';
        dateOfDeath  : Date        @title : 'Data de Falescimento';
        placeOfBirth : String      @title : 'Local de Nascimento';
        placeOfDeath : String      @title : 'Local de Falescimento';
        books        : Association to many Books on books.author = $self;
}
