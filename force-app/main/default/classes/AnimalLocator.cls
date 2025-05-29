public with sharing class AnimalLocator
{
    public static String getAnimalNameById(Integer id)
    {
        String animalName;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        if(id != null)
        {
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
            request.setMethod('GET');
            HttpResponse response = new HttpResponse();
            response = http.send(request);

            if(response.getStatusCode() == 200 && response.getBody() != null)
            {

                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                System.debug('results ' + results);
                Map<String, Object> animalObject = (Map<String, Object>) results.get('animal');
                return String.valueOf(animalObject.get('name'));
            }
        }

        return animalName;
    }
}