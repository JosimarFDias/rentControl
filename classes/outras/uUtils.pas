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
    //Tabela Cliente
    vScript.Add('alter table cliente add cli_fl_aluno char(1) default ''N'' not null; ');
    vScript.Add('alter table cliente add cli_ds_responsavel varchar(100); ');
    vScript.Add('alter table cliente add cli_vl_mensalidadeescolinha numeric(18,2) default 0 not null; ');
    //Tabela Mensalidade
    vScript.Add('CREATE TABLE MENSALIDADE (MEN_CD_MENSALIDADE INTEGER NOT NULL, ' +
                'MEN_CD_CLIENTE INTEGER NOT NULL, ' +
                'MEN_CD_MES INTEGER NOT NULL, ' +
                'MEN_CD_ANO INTEGER NOT NULL, ' +
                'MEN_CD_TITULO INTEGER NOT NULL);');
    vScript.Add('ALTER TABLE MENSALIDADE ADD CONSTRAINT PK_MENSALIDADE PRIMARY KEY (MEN_CD_MENSALIDADE);');
    vScript.Add('CREATE GENERATOR GEN_MENSALIDADE_ID;');
    vScript.Add('create trigger mensalidade_bi for mensalidade ' +
                'active before insert position 0 ' +
                'as ' +
                'begin ' +
                '  if (new.men_cd_mensalidade is null) then ' +
                '    new.men_cd_mensalidade = gen_id(gen_mensalidade_id,1); ' +
                'end;');
    vScript.Add('create procedure sp_gen_mensalidade_id ' +
                'returns (id integer) ' +
                'as ' +
                'begin ' +
                '  id = gen_id(gen_mensalidade_id, 1); ' +
                '  suspend; ' +
                'end;');
    //Tabela Conta
    vScript.Add('alter table conta add con_fl_administrador char(1) default ''N'' not null; ');
    //Tabela Sistema
    vScript.Add('create table sistema (sis_tm_inicioexpediente time not null); ');
    vScript.Add('alter table sistema add sis_tm_fimexpediente time not null; ');
    vScript.Add('alter table sistema add sis_vl_mensalidadeescolinha numeric(18,2) default 0 not null; ');
    vScript.Add('alter table sistema add sis_cd_contaprincipal integer; ');
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
