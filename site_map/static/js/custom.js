$('#siteNav').affix({
	offset: {
		top: 100
	}
})

$(document).ready( function () {
	$('#table_id').DataTable();
	console.log($('#table_id'));
} );


$(document).on('change','#my-file-selector' , function(){
	var file = document.getElementById('my-file-selector').files[0];
	var reader = new FileReader();
	if(typeof(file) == "undefined"){
	alert("error with file");
	return;
	}
	reader.readAsText(file);
	reader.onload = sendData;
  });

$('#myForm').submit(getResponse)

function getResponse(){
	var file = document.getElementById('my-file-selector').files[0];
	console.log(file);
}

function sendData(e){
	 console.log("e is");
	 console.log(e);
     $.when($.ajax({
     async: true,
     type: 'GET',
     url: '/result',
     success: function(data) {
     console.log("test1");
     }}),
     $.ajax({
     async: true,
     type: 'POST',
     contentType: 'application/json',
     url: '/go',
     dataType : 'json',
     data : JSON.stringify(e.target.result),
     success: function(data) {
     console.log("test2");
     }}))
     .then(function (resp1, resp2) {
     console.log("test3");
     var html = resp1[0].split('\\n');

     var list = [];
     var html_str = "<thead><tr>";

     var line = "";
     for (var i=0 ; i < html.length; i++){
		line = html[i].split(',');
		if(i==0){
			line[0] = line[0].substr(1);
			for(var j=0; j<line.length; j++){
     			html_str += "<th>" + line[j] + "</th>";
     		}
     		html_str += "</tr></thead><tbody>";
		}
		else{
			html_str += "<tr>";
			for(var k=0; k<line.length; k++){
				if(line[k] != "\""){
     				html_str += "<td>" + line[k] + "</td>";
     			}
     		}
     		html_str += "</tr>";
		}
		}
		html_str += "</body>"

     document.getElementById("table_id").innerHTML = html_str;
     $('#table_div').show();
});
}