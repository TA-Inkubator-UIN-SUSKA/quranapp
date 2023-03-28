// http://172.16.141.248:5000/recitations
class Reciter {
  int? id;
  String? reciterName;
  String? style;

  Reciter({this.id, this.reciterName, this.style});

  Reciter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reciterName = json['reciter_name'];
    style = json['style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reciter_name'] = this.reciterName;
    data['style'] = this.style;
    return data;
  }
}
