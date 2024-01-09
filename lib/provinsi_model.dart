class Province {
  String? provinceid;
  String? province;

  Province({this.provinceid, this.province});
  Province.fromJson(Map<String, dynamic> json) {
    provinceid = json['province_id'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['province_id'] = provinceid;
    data['province'] = province;
    return data;
  }

  static List<Province> fromJsonList(List list) {
    if (list.length == Null) return List<Province>.empty();
    return list.map((item) => Province.fromJson(item)).toList();
  }
}

class ProvinceTujuan {
  String? provinceTjid;
  String? provinceTj;

  ProvinceTujuan({this.provinceTjid, this.provinceTj});
  ProvinceTujuan.fromJson(Map<String, dynamic> json) {
    provinceTjid = json['province_id'];
    provinceTj = json['province'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['province_id'] = provinceTjid;
    data['province'] = provinceTj;
    return data;
  }

  static List<ProvinceTujuan> fromJsonList(List list) {
    if (list.length == Null) return List<ProvinceTujuan>.empty();
    return list.map((item) => ProvinceTujuan.fromJson(item)).toList();
  }
}
