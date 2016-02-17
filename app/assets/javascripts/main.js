"use strict";

(function(){

$('#status_selector').change(function(){
	console.log("Selector Changed!")
	console.log(data)
	$.ajax({
			type: 'Update',
			url: 'course/'+'params[:id]',
			success: function(data){
				var user = data.user.id
				var status = data.status
				var date = data.date
				
			}
})

})

});



