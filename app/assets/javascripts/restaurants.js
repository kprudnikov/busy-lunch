(function(window){
  'use strict';

// console.log($().jquery);

// console.log('TEST');

$.get('/find', {name: 'Loft'})
.then(function (response) {
  console.log(response);
});

}(window));