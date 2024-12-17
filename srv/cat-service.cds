using my.bookshop as my from '../db/schema';

service CatalogService {
    entity Books as projection on my.Books
    entity Autors as projection on my.Authors
}

annotate CatalogService.Books with @(

    UI: {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Livro',
            TypeNamePlural : 'Livros',
            Title: { Value: ID },
            Description: { Value: title }
        },
        SelectionFields: [ ID, title, author.name ],
        LineItem: [
            { Value: ID },
            { Value: title },
            { Value: author.name },
            { Value: price },
            { Value: currency_code }               
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Informações Sobre o Livro',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: ID },
                { Value: title },
                { Value: author_ID },
                { Value: price },
                { Value: currency_code }               
            ]
        }
    }
);    

annotate CatalogService.Autors with @(

    UI: {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Autor',
            TypeNamePlural : 'Autores',
            Title: { Value: ID },
            Description: { Value: name }
        },
        SelectionFields: [ ID, name ],
        LineItem: [
            { Value: ID },
            { Value: name },
            { Value: dateOfBirth },
            { Value: placeOfBirth },
            { Value: dateOfDeath },
            { Value: placeOfDeath }              
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Informações Sobre o Autor',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: ID },
                { Value: name },
                { Value: dateOfBirth }           
            ]
        }
    }
);