@isTest
private class ParkLocatorTest {
    @isTest static void  byCountryTest() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());  

        List<String> parkingNames = new List<String>();
        parkingNames = ParkLocator.country('Germany');

        System.assertEquals('Hamburg Wadden Sea National Park', parkingNames.get(0));
    }
}