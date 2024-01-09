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
