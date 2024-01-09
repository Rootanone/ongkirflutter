import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'kota_model.dart';
import 'provinsi_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double totalOngkir = 0.0; // Deklarasikan variabel totalOngkir
  int provIdAsal = 1;
  int kotaIdAsal = 1;
  int provIdTujuan = 1;
  int kotaIdTujuan = 1;
  double weight = 1.0;
  double subTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tugas API ongkir"),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            DropdownSearch<Province>(
              popupProps: PopupProps.menu(showSearchBox: true),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Provinsi Asal",
                  hintText: "Pilih provinsi asal",
                ),
              ),
              asyncItems: (String filter) async {
                Uri url =
                    Uri.parse("https://api.rajaongkir.com/starter/province");
                try {
                  final response = await http.get(
                    url,
                    headers: {
                      "key": "0ae702200724a396a933fa0ca4171a7e",
                      "content-type": "application/x-www-form-urlencoded",
                    },
                  );
                  var data = jsonDecode(response.body) as Map<String, dynamic>;

                  var statusCode = data["rajaongkir"]["status"]["code"];
                  if (statusCode != 200) {
                    throw data["rajaongkir"]["status"]["description"];
                  }

                  var listAllProvince =
                      data["rajaongkir"]["results"] as List<dynamic>;
                  var models = Province.fromJsonList(listAllProvince);
                  return models;
                } catch (err) {
                  print(err);
                  return List<Province>.empty();
                }
              },
              onChanged: (prov) {
                if (prov != null) {
                  print(prov.provinceid!);
                  provIdAsal = int.parse(prov.provinceid!);
                } else {
                  print("provinsi asal null");
                }
              },
              itemAsString: (item) => item.province!,
            ),
            SizedBox(height: 20),
            DropdownSearch<Kota>(
              popupProps: PopupProps.menu(showSearchBox: true),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Kota Asal",
                  hintText: "Pilih kota asal",
                ),
              ),
              asyncItems: (String filter) async {
                Uri url = Uri.parse(
                    "https://api.rajaongkir.com/starter/city?province=$provIdAsal");
                try {
                  final response = await http.get(
                    url,
                    headers: {
                      "key": "0ae702200724a396a933fa0ca4171a7e",
                      "content-type": "application/x-www-form-urlencoded",
                    },
                  );
                  var data = jsonDecode(response.body) as Map<String, dynamic>;

                  var statusCode = data["rajaongkir"]["status"]["code"];
                  if (statusCode != 200) {
                    throw data["rajaongkir"]["status"]["description"];
                  }

                  var listAllKota =
                      data["rajaongkir"]["results"] as List<dynamic>;
                  var models = Kota.fromJsonList(listAllKota);
                  return models;
                } catch (err) {
                  print(err);
                  return List<Kota>.empty();
                }
              },
              onChanged: (value) {
                print(value!.cityId);
                kotaIdAsal = int.parse(value.cityId!);
              },
              itemAsString: (item) => item.cityName!,
            ),
            SizedBox(height: 20),
            DropdownSearch<ProvinceTujuan>(
              popupProps: PopupProps.menu(showSearchBox: true),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Provinsi Tujuan",
                  hintText: "Pilih provinsi tujuan",
                ),
              ),
              asyncItems: (String filter) async {
                Uri url =
                    Uri.parse("https://api.rajaongkir.com/starter/province");
                try {
                  final response = await http.get(
                    url,
                    headers: {
                      "key": "0ae702200724a396a933fa0ca4171a7e",
                      "content-type": "application/x-www-form-urlencoded",
                    },
                  );
                  var data = jsonDecode(response.body) as Map<String, dynamic>;

                  var statusCode = data["rajaongkir"]["status"]["code"];
                  if (statusCode != 200) {
                    throw data["rajaongkir"]["status"]["description"];
                  }

                  var listAllProvince =
                      data["rajaongkir"]["results"] as List<dynamic>;
                  var models = ProvinceTujuan.fromJsonList(listAllProvince);
                  return models;
                } catch (err) {
                  print(err);
                  return List<ProvinceTujuan>.empty();
                }
              },
              onChanged: (prov_tj) {
                if (prov_tj != null) {
                  print(prov_tj.provinceTjid!);
                  provIdTujuan = int.parse(prov_tj.provinceTjid!);
                } else {
                  print("provinsi tujuan null");
                }
              },
              itemAsString: (item) => item.provinceTj!,
            ),
            SizedBox(height: 20),
            DropdownSearch<KotaTujuan>(
              popupProps: PopupProps.menu(showSearchBox: true),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Kota Tujuan",
                  hintText: "Pilih kota tujuan",
                ),
              ),
              asyncItems: (String filter) async {
                Uri url = Uri.parse(
                    "https://api.rajaongkir.com/starter/city?province=$provIdTujuan");
                try {
                  final response = await http.get(
                    url,
                    headers: {
                      "key": "0ae702200724a396a933fa0ca4171a7e",
                      "content-type": "application/x-www-form-urlencoded",
                    },
                  );
                  var data = jsonDecode(response.body) as Map<String, dynamic>;

                  var statusCode = data["rajaongkir"]["status"]["code"];
                  if (statusCode != 200) {
                    throw data["rajaongkir"]["status"]["description"];
                  }

                  var listAllKota =
                      data["rajaongkir"]["results"] as List<dynamic>;
                  var models = KotaTujuan.fromJsonList(listAllKota);
                  return models;
                } catch (err) {
                  print(err);
                  return List<KotaTujuan>.empty();
                }
              },
              onChanged: (value) {
                print(value!.cityTjId);
                kotaIdTujuan = int.parse(value.cityTjId!);
              },
              itemAsString: (item_tj) => item_tj.cityNameTj!,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Berat Barang (kg)',
                hintText: 'Masukkan berat barang dalam kilogram',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                weight = double.parse(value);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Calculate total shipping cost
                Uri url = Uri.parse("https://api.rajaongkir.com/starter/cost");
                try {
                  final response = await http.post(
                    url,
                    headers: {
                      "key": "0ae702200724a396a933fa0ca4171a7e",
                      "content-type": "application/x-www-form-urlencoded",
                    },
                    body: {
                      "origin": kotaIdAsal.toString(),
                      "originType": "city",
                      "destination": kotaIdTujuan.toString(),
                      "destinationType": "city",
                      "weight": weight.toString(),
                      "courier": "jne", // You can change the courier as needed
                    },
                  );
                  if (response.statusCode == 200) {
                    var data =
                        jsonDecode(response.body) as Map<String, dynamic>;
                    var statusCode = data["rajaongkir"]["status"]["code"];

                    if (statusCode == 200) {
                      var Ongkir = data["rajaongkir"]["results"][0]["costs"][0]
                          ["cost"][0]["value"];
                      setState(() {
                        totalOngkir = double.parse(Ongkir.toString());
                        subTotal = totalOngkir * weight;
                      });

                      // Do something with the total shipping cost
                      print('Total Ongkos : $totalOngkir');
                    } else {
                      print(
                          'Error ${statusCode}: ${data["rajaongkir"]["status"]["description"]}');
                    }
                  } else {
                    print('Error ${response.statusCode}: ${response.body}');
                  }
                } catch (err) {
                  print('Error: $err');
                }
              },
              child: Text('Hitung Ongkos Kirim'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text('Total Berat: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Text(
                  'Berat :${weight.toString()} Kg,\nOngkir/Kg : Rp. ${totalOngkir.toString()},\nTotal Ongkir: Rp. ${subTotal.toString()} ', // Format nilai sesuai kebutuhan
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
