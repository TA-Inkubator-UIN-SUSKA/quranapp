// https://api.quran.com/api/v4/quran/verses/uthmani?chapter_number=1
// https://api.quran.com/api/v4/quran/translations/33?chapter_number=1

class Verse {
  String? text;
  String? textUthmani;

  Verse({this.text, this.textUthmani});

  Verse.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    textUthmani = json['text_uthmani'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['text_uthmani'] = this.textUthmani;
    return data;
  }
}
