unit Financas.Model.Entity.Cliente;

interface

uses
     DB, Classes, SysUtils, Generics.Collections,

     /// orm
     ormbr.types.blob,
     ormbr.types.lazy,
     ormbr.types.mapping,
     ormbr.types.nullable,
     ormbr.mapping.Classes,
     ormbr.mapping.register,
     ormbr.mapping.attributes;

type

     [Entity]
     [Table('Cliente', '')]
     [PrimaryKey('ID', NotInc, NoSort, False, 'Chave primária')]
     TCliente = class
     private
          { Private declarations }
          FID: nullable<Integer>;
          FNOME: String;
          FDOCUMENTO: String;
     public
          { Public declarations }
          [Column('ID', ftInteger)]
          [Dictionary('ID', 'Mensagem de validação', '', '', '', taCenter)]
          property ID: nullable<Integer> read FID write FID;

          [Restrictions([NotNull])]
          [Column('NOME', ftString, 100)]
          [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
          property NOME: String read FNOME write FNOME;

          [Restrictions([NotNull])]
          [Column('DOCUMENTO', ftString, 14)]
          [Dictionary('DOCUMENTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
          property DOCUMENTO: String read FDOCUMENTO write FDOCUMENTO;
     end;

implementation

initialization

TRegisterClass.RegisterEntity(TCliente)

end.
