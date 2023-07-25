//Etapa 2 - Valida o CEP.
public class LeadTriggerHandler {
    public static void beforeInsert(List<Lead> newLeads) {
        validateAndFormatPostalCodes(newLeads);
    }

    public static void beforeUpdate(List<Lead> updatedLeads) {
        validateAndFormatPostalCodes(updatedLeads);
    }

    private static void validateAndFormatPostalCodes(List<Lead> leads) {
        for (Lead lead : leads) {
            if (lead.PostalCode != null) {
                String formattedPostalCode = formatPostalCode(lead.PostalCode);
                if (formattedPostalCode == null) {
                    lead.addError('Utilize apenas números.');
                } else {
                    lead.PostalCode = formattedPostalCode;
                }
            }
        }
    }

    private static String formatPostalCode(String postalCode) {
        postalCode = postalCode.replaceAll('[^0-9]', '');

        if (postalCode.length() == 8) {
            
            return postalCode.substring(0, 5);
        } else if (postalCode.length() == 9) {
            
            return postalCode.substring(0, 5) + '-' + postalCode.substring(5, 8);
        }

        return null;
    }
}
