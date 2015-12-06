function doAction() {
  var str = $("#input1").val()
  $.post("ajax?input1=" + str,
    function(data) {
      console.log(data.msg + 'added');
    }
  )
}
