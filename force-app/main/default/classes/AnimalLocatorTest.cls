@isTest
private class AnimalLocatorTest {

    @isTest static void animalGetTest(){
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String animalName = AnimalLocator.getAnimalNameById(1);
        String expectedValue = 'chicken';
        System.assertEquals(expectedValue, animalName);
    }

}