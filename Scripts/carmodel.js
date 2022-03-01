var brand_name = new Array("Maruti", "Hyundai", "Mahindra","Honda", "Ford", "Toyota", "Nissan", "Volkswagen", "Renault");

var ss_aa = new Array();
ss_aa[1]="Maruti Suzuki Swift Dzire|Maruti Suzuki Alto|Maruti Suzuki XL6|Maruti Suzuki Vitara Brezza|Maruti Suzuki S-Presso|Maruti Suzuki Baleno|Maruti Suzuki Celerio|Maruti Suzuki Swift|Maruti Suzuki Ciaz|Maruti Suzuki IGNIS|Maruti Suzuki WagonR|Maruti Suzuki CelerioX|Maruti Suzuki Swift Dzire TourS";
//Maruti
ss_aa[2]="Hyundai Creta|Hyundai Elite i20|Hyundai Venue|Hyundai Grand i10|Hyundai Verna|Hyundai Aura|Hyundai Santro|Hyundai Xcent|Hyundai Grand i10 Nios";
//Hyundai
ss_aa[3]="Mahindra Scorpio|Mahindra Bolero|Mahindra Thar|Mahindra XUV300|Mahindra XUV500|Mahindra TUV300|Mahindra KUV 100 NXT|Mahindra Marazzo|Mahindra Bolero Power+";
//Mahindra
ss_aa[4]="Honda City|Honda Amaze|Honda Civic|Honda WRV|Honda Jazz|Honda CR-V";
//Honda
ss_aa[5]="Ford EcoSport|Ford Figo|Ford Aspire";
//Ford
ss_aa[6]="Toyota Yaris|Toyota Glanza|Toyota Innova Crysta";
//Toyota
ss_aa[7]="Nissan Kicks|Nissan Sunny";
//Nissan
ss_aa[8]="Volkswagen Polo|Volkswagen Vento";
//Volkswagen
ss_aa[9]=" Renault KWID|Renault Triber|Renault Duster|Renault Captur";
//Renault
function print_brand(brand_id){
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var option_str = document.getElementById(brand_id);
	option_str.length=0;
	option_str.options[0] = new Option('Select Brand','');
	option_str.selectedIndex = 0;
	for (var i=0; i<brand_name.length; i++) {
		option_str.options[option_str.length] = new Option(brand_name[i],brand_name[i]);
	}
}

function print_model(model_id, model_index){
	var option_str = document.getElementById(model_id);
	option_str.length=0;	// Fixed by Julian Woods
	option_str.options[0] = new Option('Select Model Name','');
	option_str.selectedIndex = 0;
	var city_arr = ss_aa[model_index].split("|");
	for (var i=0; i<city_arr.length; i++) {
		option_str.options[option_str.length] = new Option(city_arr[i],city_arr[i]);
	}
}

