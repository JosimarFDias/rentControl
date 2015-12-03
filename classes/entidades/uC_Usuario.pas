unit uC_Usuario;

interface
uses
  Classes, SysUtils;
type
  TOperacaoUsuario=(ouSemOperacao, ouInserir, ouAlterar, ouExcluir);
  TUsuario=class
  private
    FAtivo: Boolean;
    FCodigo: Integer;
    FNivel: Integer;
    FSenha: string;
    FLogin: string;
    FNome: string;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetLogin(const Value: string);
    procedure SetNivel(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetSenha(const Value: string);
  published
    property Codigo:Integer read FCodigo write SetCodigo;
    property Nome:string read FNome write SetNome;
    property Senha:string read FSenha write SetSenha;
    property Login:string read FLogin write SetLogin;
    property Ativo:Boolean read FAtivo write SetAtivo;
    property Nivel:Integer read FNivel write SetNivel;
  end;
implementation

{ TUsuario }

procedure TUsuario.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TUsuario.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TUsuario.SetLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TUsuario.SetNivel(const Value: Integer);
begin
  FNivel := Value;
end;

procedure TUsuario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TUsuario.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

end.
