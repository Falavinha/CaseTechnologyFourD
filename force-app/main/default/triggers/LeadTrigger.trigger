//Etapa 2 - Valida o CEP Trigger.
trigger LeadTrigger on Lead (before insert, before update) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            LeadTriggerHandler.beforeInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            LeadTriggerHandler.beforeUpdate(Trigger.new);
        }
    }
}
