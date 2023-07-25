//Etapa 3 - O problema com o código é que ele está realizando uma consulta dentro de um loop for, o que pode resultar em problemas de desempenho e consumo de recursos. E código abaixo já está com caso resolvido.
public static void BloqueiaIntegracao(List<Opportunity> Opp){
    Set<Id> opportunityIds = new Set<Id>();
    for(Opportunity OppA : Opp){
        opportunityIds.add(OppA.Id);
    }
    
    List<OpportunityContactRole> Oppcontacts = [
        SELECT Id, Contact.Email, Contact.FirstName, Contact.LastName 
        FROM OpportunityContactRole
        WHERE OpportunityId IN :opportunityIds 
        AND Role = 'Responsável Financeiro'
    ];
    
    Map<Id, Boolean> hasFinanceRoleMap = new Map<Id, Boolean>();
    for(OpportunityContactRole ocr : Oppcontacts){
        hasFinanceRoleMap.put(ocr.OpportunityId, true);
    }
    
    for(Opportunity OppA : Opp){
        if(!hasFinanceRoleMap.containsKey(OppA.Id)){
            OppA.addError('É necessário ter o papel financeiro alinhado na oportunidade.');
        }
    }
}