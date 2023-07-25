//Etapa 2 - Valida o CEP classe de test.
@isTest
public class LeadTriggerHandlerTest {
    @isTest
    public static void testPostalCodeFormatting() {
        
        Lead lead1 = new Lead(PostalCode = '12345-6789'); 
        List<Lead> leadsToInsert = new List<Lead>{lead1};
        Test.startTest();
        Database.SaveResult[] insertResults = Database.insert(leadsToInsert, false);
        Test.stopTest();
        System.assertEquals(true, insertResults[0].isSuccess());
        System.assertEquals('12345', leadsToInsert[0].PostalCode);

        Lead lead2 = new Lead(PostalCode = '98765-4321');
        List<Lead> leadsToUpdate = new List<Lead>{lead2};
        Test.startTest();
        Database.SaveResult[] updateResults = Database.update(leadsToUpdate, false);
        Test.stopTest();
        System.assertEquals(true, updateResults[0].isSuccess());
        System.assertEquals('98765-432', leadsToUpdate[0].PostalCode);

        Lead lead3 = new Lead(PostalCode = 'A1B2C3D');
        List<Lead> leadsWithInvalidPostalCode = new List<Lead>{lead3};
        Test.startTest();
        Database.SaveResult[] insertResultsInvalid = Database.insert(leadsWithInvalidPostalCode, false);
        Test.stopTest();
        System.assertEquals(false, insertResultsInvalid[0].isSuccess());
        System.assertEquals('Utilize apenas números.', insertResultsInvalid[0].getErrors()[0].getMessage());

        Lead lead4 = new Lead(PostalCode = '123456');
        List<Lead> leadsWithInvalidLength = new List<Lead>{lead4};
        Test.startTest();
        Database.SaveResult[] updateResultsInvalid = Database.update(leadsWithInvalidLength, false);
        Test.stopTest();
        System.assertEquals(false, updateResultsInvalid[0].isSuccess());
        System.assertEquals('Utilize apenas números.', updateResultsInvalid[0].getErrors()[0].getMessage());

        Lead lead5 = new Lead(PostalCode = null);
        List<Lead> leadsWithNullPostalCode = new List<Lead>{lead5};
        Test.startTest();
        Database.SaveResult[] insertResultsNull = Database.insert(leadsWithNullPostalCode, false);
        Test.stopTest();
        System.assertEquals(true, insertResultsNull[0].isSuccess());
        System.assertEquals(null, leadsWithNullPostalCode[0].PostalCode);
    }
}
