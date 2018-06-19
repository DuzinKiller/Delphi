object fmPrincipal: TfmPrincipal
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 660
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 40
    Width = 1072
    Height = 13
    Margins.Top = 40
    Align = alTop
    Alignment = taCenter
    Caption = 'Listagem de produtos cadastrados'
    ExplicitWidth = 165
  end
  object StringGrid1: TStringGrid
    Tag = 4
    AlignWithMargins = True
    Left = 3
    Top = 59
    Width = 1072
    Height = 598
    Align = alClient
    ColCount = 4
    FixedCols = 0
    RowCount = 201
    TabOrder = 0
    ExplicitTop = 199
    ExplicitHeight = 458
    ColWidths = (
      64
      64
      64
      64)
  end
  object MainMenu1: TMainMenu
    Left = 840
    Top = 160
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      OnClick = Cadastro1Click
    end
  end
  object PrototypeBindSource1: TPrototypeBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'ID'
        FieldType = ftInteger
        Generator = 'Integers'
        ReadOnly = False
      end
      item
        Name = 'Descri'#231#227'o'
        Generator = 'BitmapNames'
        ReadOnly = False
      end
      item
        Name = 'Unidade'
        Generator = 'BitmapNames'
        ReadOnly = False
      end
      item
        Name = 'Estoque'
        FieldType = ftInteger
        Generator = 'Integers'
        ReadOnly = False
      end>
    ScopeMappings = <>
    OnCreateAdapter = PrototypeBindSource1CreateAdapter
    Left = 824
    Top = 80
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSource1
      GridControl = StringGrid1
      Columns = <>
    end
  end
end
