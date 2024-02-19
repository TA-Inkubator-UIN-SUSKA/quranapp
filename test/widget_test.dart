import 'dart:convert';

import 'package:http/http.dart';

void main() async {
  var now = new DateTime.now();
  String dateNow = "${now.year}-${now.month}-${now.day}";
  print(dateNow);
  var res = await get(
    Uri.parse("https://masehi-ke-hijriyah.p.rapidapi.com?tanggal=$dateNow"),
    headers: {
      'X-RapidAPI-Key': 'fe9d2f561bmshc61222cc1e90908p1b4ed3jsn1593cec972a4',
    },
  );
  var data = (jsonDecode(res.body))[0];

  print(data);
}
