class Word {
  int? id;
  String? textUthmani;
  String? textUthmaniSimple;
  String? textImlaei;
  String? textImlaeiSimple;
  String? textIndopak;
  int? number;
  String? audio;
  String? transliteration;
  String? unicode;
  String? unicodeUthmaniSimple;
  String? unicodeImlaei;
  String? unicodeImlaeiSimple;
  String? unicodeIndopak;
  int? idVerse;

  Word(
      {this.id,
      this.textUthmani,
      this.textUthmaniSimple,
      this.textImlaei,
      this.textImlaeiSimple,
      this.textIndopak,
      this.number,
      this.audio,
      this.transliteration,
      this.unicode,
      this.unicodeUthmaniSimple,
      this.unicodeImlaei,
      this.unicodeImlaeiSimple,
      this.unicodeIndopak,
      this.idVerse});

  Word.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    textUthmani = json['text_uthmani'];
    textUthmaniSimple = json['text_uthmani_simple'];
    textImlaei = json['text_imlaei'];
    textImlaeiSimple = json['text_imlaei_simple'];
    textIndopak = json['text_indopak'];
    number = json['number'];
    audio = json['audio'];
    transliteration = json['transliteration'];
    unicode = json['unicode'];
    unicodeUthmaniSimple = json['unicode_uthmani_simple'];
    unicodeImlaei = json['unicode_imlaei'];
    unicodeImlaeiSimple = json['unicode_imlaei_simple'];
    unicodeIndopak = json['unicode_indopak'];
    idVerse = json['id_verse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text_uthmani'] = textUthmani;
    data['text_uthmani_simple'] = textUthmaniSimple;
    data['text_imlaei'] = textImlaei;
    data['text_imlaei_simple'] = textImlaeiSimple;
    data['text_indopak'] = textIndopak;
    data['number'] = number;
    data['audio'] = audio;
    data['transliteration'] = transliteration;
    data['unicode'] = unicode;
    data['unicode_uthmani_simple'] = unicodeUthmaniSimple;
    data['unicode_imlaei'] = unicodeImlaei;
    data['unicode_imlaei_simple'] = unicodeImlaeiSimple;
    data['unicode_indopak'] = unicodeIndopak;
    data['id_verse'] = idVerse;
    return data;
  }
}
