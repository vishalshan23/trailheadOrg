public  class AnimalLocator {
    
    //getAnimalNameById mrhod get integer and returns string
    public static String getAnimalNameById(Integer id){
        String animalName = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ id );
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){
            // AnimalJsonConvert animalResult = new AnimalJsonConvert();
            animalName= AnimalJsonConvert.parse(response.getBody()).animal.name;

        }
        return animalName;
    }
}
