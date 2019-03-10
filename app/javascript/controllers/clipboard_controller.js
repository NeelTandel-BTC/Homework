import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  
  copy(event) {
    get_city_of_state()
  }
}

function get_city_of_state(){
  $.ajax({
    type: "GET",
    url: '/states',
    dataType: 'json',
    data: {selected_state: event.target.value},
    success: function(data){
      var mySelect = $("#citys")
      mySelect.empty()
      $.each(data, function(key, value) {
        mySelect.append($("<option></option>")
                .attr("value",key)
                .text(value)); 
   });
    }
  });
}