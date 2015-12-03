unit uUtils;

interface
uses
  Classes, ppReport;
type
  TFormaPagamento=(fpAvista, fpNotas);
  procedure UpdateDataBase;
  procedure PrintReport(pReportName:string; pReport: TppReport);
implementation

uses uDM, uform_base_relatorio;

procedure PrintReport(pReportName:string; pReport: TppReport);
begin
  form_base_relatorio.ppRelatorio.Visible := True;
  form_base_relatorio.reportName          := pReportName;
  form_base_relatorio.ppRelatorio.Report  := pReport;
  pReport.PrintToDevices;
end;

procedure UpdateDataBase;
var
  vScript:TStringList;
  i: Integer;
begin
  vScript := TStringList.Create;
  try
    //Tabela Conta
    vScript.Add('alter table conta add con_fl_administrador char(1) default ''N'' not null; ');
    //Tabela Sistema
    vScript.Add('create table sistema (sis_tm_inicioexpediente time not null); ');
    vScript.Add('alter table sistema add sis_tm_fimexpediente time not null; ');
    for i := 0 to vScript.Count - 1 do
    begin
      try
        DM.Connect.ExecuteDirect(vScript[i]);
      except
      end;
    end;
  finally
    vScript.Free;
  end;
end;

end.
