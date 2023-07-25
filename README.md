Case de Technology - FourD
Perfil Desenvolvedor Salesforce
1
Instruções
O case é composto por duas etapas, conforme descrito abaixo.
O resultado case será avaliado através do fornecimento do repositório Github contendo os códigos
produzidos.
Case
Etapa 1
A Shark Caminhões procurou a FourD para a Implementação do Salesforce em sua Companhia. A
grande preocupação da Shark Caminhões é que o Backoffce tenha uma experiência normal em
situações de alta demanda de uso. Para isto, no Processo de Captação de Leads e Conversão de Novos
Clientes eles gostariam de implementar um simples envio de mensagens para os Leads/Clientes
através da API do WhatsApp Web. Sendo assim:
Desenvolva uma VisualForce Page que execute uma chamada na API do WhatsApp Web com uma
simples mensagem para o número de Telefone do Lead.
A descrição da mensagem pode ser: “Olá –>Lead<—tudo bem? Informamos que já estamos
analisando seu cadastro para se tornar um de nossos clientes. Em breve retornaremos o contato”.
Etapa 2
Validar através de Trigger em Lead, seguindo o padrão de triggerHandler (before insert / before
update) que valida o CEP informado no campo Lead.PostalCode, aceitando como entrada o formato
XXXXX-XXX ou XXXXXXXX apenas números, deverá emitir erro caso receba um outro tipo de
caracter e que padronize a saída no formato XXXXX-XXX.
Escrever rotina de teste, para sucesso e falha.
Obs.: Quanto a quais campos o objeto possui, pode utilizar a informação standard do objeto como
base.
Etapa 3
Depois de Implementado o Projeto, a TI da Shark Caminhões assumiu o ambiente. Porém, eles
tiveram um problema ao executar um processo de negócio no Fluxo de Vendas e solicitaram apoio da
FourD na resolução. Eles desenvolveram o código abaixo:
Public static void BloqueiaIntegracao(List<Opportunity> Opp){
 List<OpportunityContactRole> Oppcontacts = New List<OpportunityContactRole>();
 for(Opportunity OppA : Opp){
 Oppcontacts = [SELECT id,contact.email,contact.fistname,contact.lastname from OpportunityContactRole
where Opportunityid =: OppA.id AND Role =: 'Responsável Financeiro'];
 if(Oppcontacts.size()=0){
 oppA.addError( 'É necessario ter o papel financeiro alinhado na oportunidade.');
 }
 }
}
