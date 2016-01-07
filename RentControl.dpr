program RentControl;

uses
  SysUtils,
  Forms,
  uCDAO_Agenda in 'classes\dao\uCDAO_Agenda.pas',
  uCDAO_Aluno in 'classes\dao\uCDAO_Aluno.pas',
  uCDAO_Ambiente in 'classes\dao\uCDAO_Ambiente.pas',
  uCDAO_Cliente in 'classes\dao\uCDAO_Cliente.pas',
  uCDAO_Conta in 'classes\dao\uCDAO_Conta.pas',
  uCDAO_Fornecedor in 'classes\dao\uCDAO_Fornecedor.pas',
  uCDAO_MovimentoConta in 'classes\dao\uCDAO_MovimentoConta.pas',
  uCDAO_Pagar in 'classes\dao\uCDAO_Pagar.pas',
  uCDAO_Receber in 'classes\dao\uCDAO_Receber.pas',
  uCDAO_Sistema in 'classes\dao\uCDAO_Sistema.pas',
  uCDAO_Usuario in 'classes\dao\uCDAO_Usuario.pas',
  uC_Agenda in 'classes\entidades\uC_Agenda.pas',
  uC_Aluno in 'classes\entidades\uC_Aluno.pas',
  uC_Ambiente in 'classes\entidades\uC_Ambiente.pas',
  uC_Classes in 'classes\entidades\uC_Classes.pas',
  uC_Cliente in 'classes\entidades\uC_Cliente.pas',
  uC_Conta in 'classes\entidades\uC_Conta.pas',
  uC_Fornecedor in 'classes\entidades\uC_Fornecedor.pas',
  uC_MovimentoConta in 'classes\entidades\uC_MovimentoConta.pas',
  uC_Pagar in 'classes\entidades\uC_Pagar.pas',
  uC_Receber in 'classes\entidades\uC_Receber.pas',
  uc_Sistema in 'classes\entidades\uc_Sistema.pas',
  uC_Usuario in 'classes\entidades\uC_Usuario.pas',
  uclSalvaRelatorio in 'classes\outras\uclSalvaRelatorio.pas',
  uUtils in 'classes\outras\uUtils.pas',
  uForm_Cadastro_Aluno in 'formularios\cadastro\uForm_Cadastro_Aluno.pas' {Form_Cadastro_Aluno},
  uForm_Cadastro_Ambiente in 'formularios\cadastro\uForm_Cadastro_Ambiente.pas' {FormCadastroAmbiente},
  uForm_Cadastro_Cliente in 'formularios\cadastro\uForm_Cadastro_Cliente.pas' {FormCadastroCliente},
  uForm_Cadastro_Conta in 'formularios\cadastro\uForm_Cadastro_Conta.pas' {FormCadastroConta},
  uForm_Cadastro_Fornecedor in 'formularios\cadastro\uForm_Cadastro_Fornecedor.pas' {FormCadastroFornecedor},
  uForm_Cadastro_Pagar in 'formularios\cadastro\uForm_Cadastro_Pagar.pas' {FormCadastroPagar},
  uForm_Cadastro_Receber in 'formularios\cadastro\uForm_Cadastro_Receber.pas' {FormCadastroReceber},
  uForm_Cadastro_Scheduler_Ribbon in 'formularios\cadastro\uForm_Cadastro_Scheduler_Ribbon.pas' {Form_Cadastro_Scheduler_Ribbon},
  uForm_Cadastro_Usuario in 'formularios\cadastro\uForm_Cadastro_Usuario.pas' {FormCadastroUsuario},
  uForm_ContasPagar in 'formularios\cadastro\uForm_ContasPagar.pas' {FormPagar},
  uForm_ContasReceber in 'formularios\cadastro\uForm_ContasReceber.pas' {FormReceber},
  uDM in 'formularios\dataModule\uDM.pas' {DM: TDataModule},
  uform_base_relatorio in 'formularios\heranca\uform_base_relatorio.pas' {Form_Base_Relatorio},
  uform_heranca_diag in 'formularios\heranca\uform_heranca_diag.pas' {Frm_Diag_Heranca},
  uForm_ConfiguracoesSistema in 'formularios\outros\uForm_ConfiguracoesSistema.pas' {FormConfiguracoesSistema},
  uForm_Edicao_Scheduler in 'formularios\outros\uForm_Edicao_Scheduler.pas' {Form_Edicao_Scheduler},
  uForm_Login in 'formularios\outros\uForm_Login.pas' {Form_Login},
  uForm_MovimentoConta in 'formularios\outros\uForm_MovimentoConta.pas' {FormMovimentoConta},
  uForm_Pesquisa in 'formularios\outros\uForm_Pesquisa.pas' {FormPesquisa},
  uForm_Principal in 'formularios\outros\uForm_Principal.pas' {FormPrincipal},
  uFormAgendamentoPacote in 'formularios\outros\uFormAgendamentoPacote.pas' {FormAgendamentoPacote},
  uForm_Rel_AgendasPorCliente in 'formularios\relatorio\uForm_Rel_AgendasPorCliente.pas' {Frm_Rel_AgendasPorCliente},
  uForm_Rel_AgendasPorDiaSemana in 'formularios\relatorio\uForm_Rel_AgendasPorDiaSemana.pas' {Frm_Rel_AgendasPorDiaSemana},
  uForm_Rel_ContasPagar in 'formularios\relatorio\uForm_Rel_ContasPagar.pas' {Frm_Rel_ContasAPagar},
  uForm_Rel_ReceitasDespesas in 'formularios\relatorio\uForm_Rel_ReceitasDespesas.pas' {Frm_Rel_ReceitasDespesas},
  uForm_Rel_RelacaoCliente in 'formularios\relatorio\uForm_Rel_RelacaoCliente.pas' {Frm_Rel_RelacaoCliente},
  uFormChart in 'formularios\relatorio\uFormChart.pas' {FormChart},
  uForm_Cadastro_Mensalidade in 'formularios\cadastro\uForm_Cadastro_Mensalidade.pas' {FormCadastroMensalidade},
  uC_Mensalidade in 'classes\entidades\uC_Mensalidade.pas',
  uCDAO_Mensalidade in 'classes\dao\uCDAO_Mensalidade.pas',
  uForm_Rel_ContasReceber in 'formularios\relatorio\uForm_Rel_ContasReceber.pas' {Frm_Rel_ContasAReceber},
  uFormEspera in 'formularios\outros\uFormEspera.pas' {FormEspera};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Sistema := TSistema.Create;
  Sistema.Inicializa;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
