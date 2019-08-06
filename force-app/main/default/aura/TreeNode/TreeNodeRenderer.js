({
    afterRender:function(compnent){
        this.superAfterRender();
        console.log(compnent.find('testid'));
    }
})