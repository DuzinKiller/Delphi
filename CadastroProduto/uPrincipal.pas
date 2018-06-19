unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProduto, Vcl.StdCtrls, uProdutoDB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MSSQL,
  FireDAC.Phys.ODBCBase, Vcl.Grids, Vcl.Menus, uCadastroProduto, dm,
  Data.Bind.ObjectScope, Data.Bind.Components, System.Generics.Collections,
  Data.Bind.DBScope, Datasnap.DBClient, Data.Bind.GenData, Vcl.Bind.GenData,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid;

type
  TfmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Label1: TLabel;
    PrototypeBindSource1: TPrototypeBindSource;
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
    procedure Cadastro1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PrototypeBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    { Private declarations }
    procedure ListarObjetoProduto;

  public
    FListaProduto: Array of TProduto;

    FListProduto: TObjectList<TProduto>;

    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

procedure TfmPrincipal.FormCreate(Sender: TObject);
begin
     ListarObjetoProduto;
end;

procedure TfmPrincipal.ListarObjetoProduto;
var xProdDB : TProdutoDB;
begin
     xProdDB := TProdutoDB.Create(dmProduto.FDConnection);
     try
        FListProduto.Clear;
        FListProduto.AddRange(xProdDB.ListaProdutos);
        PrototypeBindSource1.Refresh;
     finally
        FreeAndNil(xProdDB);
     end;
end;

procedure TfmPrincipal.PrototypeBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
     FListProduto := TObjectList<TProduto>.Create;
     ABindSourceAdapter := TListBindSourceAdapter<TProduto>.Create(Self, FListProduto);
end;

procedure TfmPrincipal.Cadastro1Click(Sender: TObject);
var xTelaCadProd : TfmCadastroProduto;
begin
     try
        xTelaCadProd := TfmCadastroProduto.Create(Self);
        xTelaCadProd.ShowModal;
        ListarObjetoProduto;
        PrototypeBindSource1.Refresh;
     finally
        FreeAndNil(xTelaCadProd);
     end;
end;


end.
