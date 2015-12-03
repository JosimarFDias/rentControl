program RentControl;

uses
  SysUtils,
  Forms,
  uC_Agenda in 'uC_Agenda.pas',
  uC_Ambiente in 'uC_Ambiente.pas',
  uC_Cliente in 'uC_Cliente.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uCDAO_Cliente in 'uCDAO_Cliente.pas',
  uCDAO_Agenda in 'uCDAO_Agenda.pas',
  uCDAO_Ambiente in 'uCDAO_Ambiente.pas',
  uForm_Cadastro_Scheduler_Ribbon in 'uForm_Cadastro_Scheduler_Ribbon.pas' {Form_Cadastro_Scheduler_Ribbon},
  uForm_Edicao_Scheduler in 'uForm_Edicao_Scheduler.pas' {Form_Edicao_Scheduler},
  uForm_Pesquisa in 'uForm_Pesquisa.pas' {FormPesquisa},
  uForm_Cadastro_Cliente in 'uForm_Cadastro_Cliente.pas' {FormCadastroCliente},
  uC_Classes in 'uC_Classes.pas',
  uC_Aluno in 'uC_Aluno.pas',
  uCDAO_Aluno in 'uCDAO_Aluno.pas',
  uC_Usuario in 'uC_Usuario.pas',
  uCDAO_Usuario in 'uCDAO_Usuario.pas',
  uForm_Login in 'uForm_Login.pas' {Form_Login},
  uForm_Cadastro_Usuario in 'uForm_Cadastro_Usuario.pas' {FormCadastroUsuario},
  uForm_Cadastro_Aluno in 'uForm_Cadastro_Aluno.pas' {Form_Cadastro_Aluno},
  uc_Sistema in 'uc_Sistema.pas',
  uForm_Principal in 'uForm_Principal.pas' {FormPrincipal},
  uC_MovimentoConta in 'uC_MovimentoConta.pas',
  uForm_MovimentoConta in 'uForm_MovimentoConta.pas' {FormMovimentoConta},
  uC_Conta in 'uC_Conta.pas',
  uCDAO_Conta in 'uCDAO_Conta.pas',
  uForm_Cadastro_Conta in 'uForm_Cadastro_Conta.pas' {FormCadastroConta},
  uCDAO_MovimentoConta in 'uCDAO_MovimentoConta.pas',
  uForm_Cadastro_Ambiente in 'uForm_Cadastro_Ambiente.pas' {FormCadastroAmbiente},
  uFormAgendamentoPacote in 'uFormAgendamentoPacote.pas' {FormAgendamentoPacote},
  uUtils in 'uUtils.pas',
  uForm_ConfiguracoesSistema in 'uForm_ConfiguracoesSistema.pas' {FormConfiguracoesSistema},
  uCDAO_Sistema in 'uCDAO_Sistema.pas',
  uC_Receber in 'uC_Receber.pas',
  uCDAO_Receber in 'uCDAO_Receber.pas',
  uForm_Cadastro_Receber in 'uForm_Cadastro_Receber.pas' {FormCadastroReceber},
  uForm_ContasReceber in 'uForm_ContasReceber.pas' {FormReceber},
  uC_Fornecedor in 'uC_Fornecedor.pas',
  uCDAO_Fornecedor in 'uCDAO_Fornecedor.pas',
  uForm_Cadastro_Fornecedor in 'uForm_Cadastro_Fornecedor.pas' {FormCadastroFornecedor},
  uC_Pagar in 'uC_Pagar.pas',
  uCDAO_Pagar in 'uCDAO_Pagar.pas',
  uForm_Cadastro_Pagar in 'uForm_Cadastro_Pagar.pas' {FormCadastroPagar},
  uForm_ContasPagar in 'uForm_ContasPagar.pas' {FormPagar},
  uclSalvaRelatorio in 'uclSalvaRelatorio.pas',
  uform_base_relatorio in 'uform_base_relatorio.pas' {Form_Base_Relatorio},
  uform_heranca_diag in 'uform_heranca_diag.pas' {Frm_Diag_Heranca},
  uForm_Rel_RelacaoCliente in 'uForm_Rel_RelacaoCliente.pas' {Frm_Rel_RelacaoCliente},
  uForm_Rel_AgendasPorCliente in 'uForm_Rel_AgendasPorCliente.pas' {Frm_Rel_AgendasPorCliente},
  uForm_Rel_AgendasPorDiaSemana in 'uForm_Rel_AgendasPorDiaSemana.pas' {Frm_Rel_AgendasPorDiaSemana},
  uFormChart in 'uFormChart.pas' {FormChart},
  uForm_Rel_ReceitasDespesas in 'uForm_Rel_ReceitasDespesas.pas' {Frm_Rel_ReceitasDespesas},
  uForm_Rel_ContasPagar in 'uForm_Rel_ContasPagar.pas' {Frm_Rel_ContasAPagar};

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
