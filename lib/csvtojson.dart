import 'dart:convert';
import 'dart:io';

void main() async {
  List<Map<String, dynamic>> jsonCon = [];

  File file = File('C:\\ecommerce_products.csv');

  if (await file.exists()) {
    String content = file.readAsStringSync();

    List<String> Data = content.split('\n');
    List<String> Keys = Data[0].split(',');
    for (var d in Data.skip(1)) {
      if (d.trim().isEmpty) continue;

      List<String> values = d.split(',');
      Map<String, dynamic> object = {};

      for (var i = 0; i < Keys.length; i++) {
        object[Keys[i]] = values[i];
      }

      jsonCon.add(object);
    }

File jsonFile = File("jsonCon.json");

if(await jsonFile.exists()){

jsonFile.writeAsStringSync(jsonEncode(jsonCon));

    print("✅ CSV to JSON converted successfully!");

}
else{
      print("❌ File Not Found");

}


  } else {
    print("Not Found");
  }
}
