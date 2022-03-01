var state_arr = new Array("Jodhpur");

var s_a = new Array();
s_a[0]=""
s_a[1]="Madhuban |Sardarpura";
function print_city(state_id){
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var option_str = document.getElementById(state_id);
	option_str.length=0;
	option_str.options[0] = new Option('Select City','');
	option_str.selectedIndex = 0;
	for (var i=0; i<state_arr.length; i++) {
		option_str.options[option_str.length] = new Option(state_arr[i],state_arr[i]);
	}
}

function print_local(city_id, city_index){
	var option_str = document.getElementById(city_id);
	option_str.length=0;
	option_str.options[0] = new Option('Select Locality','');
	option_str.selectedIndex = 0;
	var city_arr = s_a[city_index].split("|");
	for (var i=0; i<city_arr.length; i++) {
		option_str.options[option_str.length] = new Option(city_arr[i],city_arr[i]);
	}
}
