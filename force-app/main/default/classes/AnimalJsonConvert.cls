public class AnimalJsonConvert{
        public cls_animal animal;
        public class cls_animal {
            public Integer id;	//1
            public String name;	//chicken
            public String eats;	//chicken food
            public String says;	//cluck cluck
        }
        public static AnimalJsonConvert parse(String json){
            return (AnimalJsonConvert) System.JSON.deserialize(json, AnimalJsonConvert.class);
        }
    }