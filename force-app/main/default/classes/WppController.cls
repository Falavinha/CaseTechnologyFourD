//Etapa 1 - API do WhatsApp.
public with sharing class WppController {
    public String leadId { get; set; }
    public Boolean hasResult { get; set; }
    public Boolean result { get; set; }

    public void sendTemplateMessage() {
        Lead leadDetail = [SELECT Id, Phone FROM Lead WHERE Id = :leadId];

        String whatsAppNumber = '55' + leadDetail.Phone;

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://graph.facebook.com/v17.0/116039088225538/messages');
        req.setHeader('Content-type', 'application/json');
        req.setMethod('POST');

        String body = '{"messaging_product": "whatsapp", "to": "' + whatsAppNumber + '", "type": "template", "template": {"name": "hello_world", "language": {"code": "en_US"}}}';
        req.setBody(body);

        String apiToken = 'EAALjFsmMjQQBAJJqWPXWSZApTiMZAHJZBxZC4esFZBxcveFLwoX9WTROdmg6jL9VwJhYrR3z7wWPoZAI8zKQQ6ZAkY91VZC19zmRScDMZBDPfwc8vv0vnQGUbVd6DKkOg3sPCbmMMysLikL6fTwvzTKZCZAgfSMYtbO3cb2qnSRy02izK6qomjpQ82ozEeUKZCtKxQwkCUfk3FGNEwZDZD';
        req.setHeader('Authorization', 'Bearer ' + apiToken);

        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            hasResult = true;
            result = true;
        } else {
            hasResult = true;
            result = false;
        }
    }
}
