class Kota {
  String? cityId;
  String? provinceid;
  String? province;
  String? type;
  String? cityName;
  String? postalCode;

  Kota(
      {this.cityId,
      this.provinceid,
      this.province,
      this.type,
      this.cityName,
      this.postalCode});

  Kota.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    provinceid = json['province_id'];
    province = json['province'];
    type = json['type'];
    cityName = json['city_name'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['province_id'] = provinceid;
    data['province'] = province;
    data['type'] = type;
    data['city_name'] = cityName;
    return data;
  }

  static List<Kota> fromJsonList(List list) {
    if (list.length == Null) return List<Kota>.empty();
    return list.map((item) => Kota.fromJson(item)).toList();
  }
}

class KotaTujuan {
  String? cityTjId;
  String? provinceTjid;
  String? provinceTj;
  String? typeTj;
  String? cityNameTj;
  String? postalCodeTj;

  KotaTujuan(
      {this.cityTjId,
      this.provinceTjid,
      this.provinceTj,
      this.typeTj,
      this.cityNameTj,
      this.postalCodeTj});

  KotaTujuan.fromJson(Map<String, dynamic> json) {
    cityTjId = json['city_id'];
    provinceTjid = json['province_id'];
    provinceTj = json['province'];
    typeTj = json['type'];
    cityNameTj = json['city_name'];
    postalCodeTj = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city_id'] = cityTjId;
    data['province_id'] = provinceTjid;
    data['province'] = provinceTj;
    data['type'] = typeTj;
    data['city_name'] = cityNameTj;
    data['postal_code'] = postalCodeTj;
    return data;
  }

  static List<KotaTujuan> fromJsonList(List list) {
    if (list.length == Null) return List<KotaTujuan>.empty();
    return list.map((item) => KotaTujuan.fromJson(item)).toList();
  }
}

