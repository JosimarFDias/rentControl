unit uclSalvaRelatorio;

interface
  uses ppReport, SysUtils, Dialogs;

type
  TTipoExtensao = (tePDF, teDOC, teXLS, teTXT);
  TSalvaRelatorio = class
  public
    class procedure PrepareImpressoraScreen(rReport: TppReport);
    class procedure PrepareImpressoraPrinter(rReport: TppReport);
    class procedure SalvaExtensaoPDF(rReport: TppReport; sNomeArquivo: String);
    class procedure SalvaExtensaoDOC(rReport: TppReport; sNomeArquivo: String);
    class procedure SalvaExtensaoXLS(rReport: TppReport; sNomeArquivo: String);
    class procedure SalvaExtensaoTXT(rReport: TppReport; sNomeArquivo: String);
    class procedure SalvaRelatorioExtensao(pReport: TppReport; pTipoExtensao: TTipoExtensao; pNomeArquivo: String);
  end;

 implementation

 { TClassImprimePDF }

 //Serve para preparar a impressora em modo de PDF
class procedure TSalvaRelatorio.SalvaExtensaoPDF(rReport: TppReport; sNomeArquivo: String);
var
  wNomarq : string;
begin
  inherited;
  try
    with rReport do
    begin
      DeviceType       := 'PDF';
      AllowPrintToFile := True;
      ShowPrintDialog  := False;
      SaveAsTemplate   := True;
      SavePrinterSetup := True;
      TextFileName     := sNomeArquivo;
      Print;
    end;
  except
    on E: Exception do
    begin
      if Pos('Cannot Open File', E.Message) > 0 then
        raise Exception.Create('Arquivo está aberto. Feche o Adobe para salvar o arquivo!')
      else
        raise E;
    end;
  end;
end;

class procedure TSalvaRelatorio.SalvaExtensaoTXT(rReport: TppReport;
  sNomeArquivo: String);
var
  wNomarq : string;
begin
  inherited;
  try
    with rReport do
    begin
      DeviceType       := 'TextFile';
      AllowPrintToFile := True;
      ShowPrintDialog  := False;
      SaveAsTemplate   := True;
      SavePrinterSetup := True;
      TextFileName     := sNomeArquivo;
      Print;
    end;
  except
    on E: Exception do
    begin
      if Pos('Cannot Open File', E.Message) > 0 then
        raise Exception.Create('Arquivo está aberto. Feche o Bloco de Notas para salvar o arquivo!')
      else
        raise E;
    end;
  end;
end;

class procedure TSalvaRelatorio.SalvaExtensaoXLS(rReport: TppReport;
  sNomeArquivo: String);
var
  wNomarq : string;
begin
  inherited;
  try
    with rReport do
    begin
      DeviceType       := 'XLSData';
      AllowPrintToFile := True;
      ShowPrintDialog  := False;
      SaveAsTemplate   := True;
      SavePrinterSetup := True;
      TextFileName     := sNomeArquivo;
      Print;
    end;
  except
    on E: Exception do
    begin
      if Pos('Cannot Open File', E.Message) > 0 then
        raise Exception.Create('Arquivo está aberto. Feche o Excel para salvar o arquivo!')
      else
        raise E;
    end;
  end;
end;

class procedure TSalvaRelatorio.SalvaRelatorioExtensao(pReport: TppReport;
  pTipoExtensao: TTipoExtensao; pNomeArquivo: String);
begin
  inherited;
  try
    with pReport do
    begin
      case pTipoExtensao of
        tePDF: DeviceType := 'PDF';
        teDOC: DeviceType := 'DOC';
        teXLS: DeviceType := 'XLSReport';
        teTXT: DeviceType := 'TextFile';
      end;

      AllowPrintToFile := True;
      ShowPrintDialog  := False;
      SaveAsTemplate   := True;
      SavePrinterSetup := True;
      TextFileName     := pNomeArquivo;
      Print;
    end;
  except
    on E: Exception do
    begin
      if Pos('Cannot Open File', E.Message) > 0 then
        raise Exception.Create('Arquivo está aberto. Feche o Excel para salvar o arquivo!')
      else
        raise E;
    end;
  end;
end;

//Serve para preparar a impressora no modo de screen na tela
class procedure TSalvaRelatorio.PrepareImpressoraPrinter(rReport: TppReport);
begin
  with rReport do
  begin
    if ShowPrintDialog = False then
      ShowPrintDialog := True;
    DeviceType := 'Printer';
  end;
end;

class procedure TSalvaRelatorio.PrepareImpressoraScreen(rReport: TppReport);
begin
  with rReport do
  begin
    if ShowPrintDialog = False then
      ShowPrintDialog := True;
    DeviceType := 'Screen';
  end;
end;

class procedure TSalvaRelatorio.SalvaExtensaoDOC(rReport: TppReport;
  sNomeArquivo: String);
var
  wNomarq : string;
begin
  inherited;
  try
    with rReport do
    begin
      DeviceType       := 'DOC';
      AllowPrintToFile := True;
      ShowPrintDialog  := False;
      SaveAsTemplate   := True;
      SavePrinterSetup := True;
      TextFileName     := sNomeArquivo;
      Print;
    end;
  except
    on E: Exception do
    begin
      if Pos('Cannot Open File', E.Message) > 0 then
        raise Exception.Create('Arquivo está aberto. Feche o Word para salvar o arquivo!')
      else
        raise E;
    end;
  end;
end;

{}
end.
