var booDebug = false;
var app = {
    'init':function(){
        consoleDebug('Inited Now');
    }
}

function formArrayToObject(arrForm){

    return arrForm.reduce(function(result, item){
        result[item.name] = item.value;
        return result;
    }, {});

}

function consoleDebug(args){

    if(booDebug){
        console.log(args);
    }

}

function scrollToEl(el){
    var jEl = $(el);
    $('html,body').scrollTop(jEl.offset().top);
    //$('html,body').animate({scrollTop: aTag.offset().top}, 'slow');
}

//Document Ready
$(function(){

    app.init();

    setTimeout(function(){
        
        app.hideLoader(1000);

    }, 1000);
    
});