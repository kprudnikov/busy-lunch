(function () {
  'use strict';
  $("#restaurant_name").on('keyup', function () {
    // console.log(this.value);
    var name = this.value;
    $.get('/find', {name: name}, function (response) {
      console.log(response);
    });
  });
})();