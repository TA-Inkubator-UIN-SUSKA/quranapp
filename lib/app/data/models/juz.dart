class Juz {
  int? id;
  String? name;
  int? number;
  String? juzStartInfo;
  String? juzEndInfo;

  Juz({this.id, this.name, this.number, this.juzStartInfo, this.juzEndInfo});

  Juz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    juzStartInfo = json['juzStartInfo'];
    juzEndInfo = json['juzEndInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    data['juzStartInfo'] = juzStartInfo;
    data['juzEndInfo'] = juzEndInfo;
    return data;
  }
}
