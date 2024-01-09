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
  @override
  Widget build(BuildContext context) {
    int provIdAsal = 1;
    int kotaIdAsal = 1;
    int provIdTujuan = 1;
    int kotaIdTujuan = 1;
    double weight = 1.0;
    double totalOngkir = 0.0;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ongkir"),
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
                      "key": "56660ffe5ccb2b50cde748f5e3ef8bcb",
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
                      "key": "56660ffe5ccb2b50cde748f5e3ef8bcb",
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
            DropdownSearch<Province>(
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
                      "key": "56660ffe5ccb2b50cde748f5e3ef8bcb",
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
                  provIdTujuan = int.parse(prov.provinceid!);
                } else {
                  print("provinsi tujuan null");
                }
              },
              itemAsString: (item) => item.province!,
            ),
            SizedBox(height: 20),
            DropdownSearch<Kota>(
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
                      "key": "56660ffe5ccb2b50cde748f5e3ef8bcb",
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
                kotaIdTujuan = int.parse(value.cityId!);
              },
              itemAsString: (item) => item.cityName!,
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
                // Menghitung total biaya pengiriman
                Uri url = Uri.parse("https://api.rajaongkir.com/starter/cost");
                try {
                  final response = await http.post(
                    url,
                    headers: {
                      "key": "56660ffe5ccb2b50cde748f5e3ef8bcb",
                      "content-type": "application/x-www-form-urlencoded",
                    },
                    body: {
                      "origin": kotaIdAsal.toString(),
                      "originType": "city",
                      "originDetails":
                          provIdAsal.toString(), // Tambahkan detail asal
                      "destination": kotaIdTujuan.toString(),
                      "destinationType": "city",
                      "destinationDetails":
                          provIdTujuan.toString(), // Tambahkan detail tujuan
                      "weight": weight.toString(),
                      "courier":
                          "jne", // Anda dapat mengganti kurir sesuai kebutuhan
                    },
                  );
                  var data = jsonDecode(response.body) as Map<String, dynamic>;

                  var statusCode = data["rajaongkir"]["status"]["code"];
                  if (statusCode != 200) {
                    throw data["rajaongkir"]["status"]["description"];
                  }

                  var ongkir = data["rajaongkir"]["results"][0]["costs"][0]
                      ["cost"][0]["value"];
                  totalOngkir = double.parse(ongkir.toString());

                  // Hitung total biaya (berat * ongkos kirim)
                  double total = weight * totalOngkir;

                  // Lakukan sesuatu dengan total biaya
                  print('Total Ongkos Kirim: $total');

                  // Perbarui antarmuka pengguna untuk menampilkan total biaya
                  setState(() {
                    totalOngkir = total;
                  });
                } catch (err) {
                  print(err);
                }
              },
              child: Text('Hitung Ongkos Kirim'),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Text(
                'Total Ongkos Kirim: $totalOngkir',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
