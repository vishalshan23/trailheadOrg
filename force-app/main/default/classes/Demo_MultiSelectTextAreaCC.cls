public class Demo_MultiSelectTextAreaCC {

    String select_options = 'optionA,OptionB,OptionC,Optiond,Optione,Optionf,Opitong';
    
    public list<SelectOption> getFieldOptions(){
        list<SelectOption> tempOptions = new list<SelectOption>();
        tempOptions.add(new SelectOption('','--None--') );
        
        for(String str :select_options.split(',')){
            SelectOption opt = new SelectOption(str ,str );
            tempOptions.add(opt);
            
        }
        return tempOptions;
    }
}