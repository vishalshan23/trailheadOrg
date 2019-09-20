public  class ParkLocator {

    //takes the country name and return the list of available park locations
    public static list<String> country(String name){
        ParkService.ParksImplPort parkServ= new ParkService.ParksImplPort();
        return parkServ.byCountry(name);

    }
}