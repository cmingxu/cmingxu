// Anonymous Module Nothing is global;
(function(){
 var current = null;
 var labels = [
 'home' : 'home',
 'articles' : 'articles',
 'contact' : 'contact'
 ];

 function init(){};

 function show(){
 current = 1;
 };

 function hide(){
 show();
 }
 })();


// Module Pattern: You need to specify what is global and what isn't  
// Switching syntax in between.

module = function(){
    var labels = [
        'name' : 'name',
        'articles' : 'articles',
        'contact' : 'contact'
            ];

    return {
current : null,
        init : function(){
        },
show : function(){},
       hide: function(){
           module.show();
       }
    }
}
