// https://api.mfikridev.xyz/verses/by_chapter/2?translation=17&tafsir=2
class Verse {
  int? numberInQuran;
  int? idJuz;
  int? idChapter;
  int? numberInChapter;
  String? transliteration;
  Text? text;
  Translation? translation;
  Tafsir? tafsir;

  Verse(
      {this.numberInQuran,
      this.idJuz,
      this.idChapter,
      this.numberInChapter,
      this.transliteration,
      this.text,
      this.translation,
      this.tafsir});

  Verse.fromJson(Map<String, dynamic> json) {
    numberInQuran = json['number_in_quran'];
    idJuz = json['id_juz'];
    idChapter = json['id_chapter'];
    numberInChapter = json['number_in_chapter'];
    transliteration = json['transliteration'];
    text = json['text'] != null ? new Text.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? new Translation.fromJson(json['translation'])
        : null;
    tafsir =
        json['tafsir'] != null ? new Tafsir.fromJson(json['tafsir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number_in_quran'] = this.numberInQuran;
    data['id_juz'] = this.idJuz;
    data['id_chapter'] = this.idChapter;
    data['number_in_chapter'] = this.numberInChapter;
    data['transliteration'] = this.transliteration;
    if (this.text != null) {
      data['text'] = this.text!.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation!.toJson();
    }
    if (this.tafsir != null) {
      data['tafsir'] = this.tafsir!.toJson();
    }
    return data;
  }
}

class Text {
  String? textUthmani;
  String? textUthmaniSimple;
  String? textImlaei;
  String? textImlaeiSimple;
  String? textIndopak;

  Text(
      {this.textUthmani,
      this.textUthmaniSimple,
      this.textImlaei,
      this.textImlaeiSimple,
      this.textIndopak});

  Text.fromJson(Map<String, dynamic> json) {
    textUthmani = json['text_uthmani'];
    textUthmaniSimple = json['text_uthmani_simple'];
    textImlaei = json['text_imlaei'];
    textImlaeiSimple = json['text_imlaei_simple'];
    textIndopak = json['text_indopak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text_uthmani'] = this.textUthmani;
    data['text_uthmani_simple'] = this.textUthmaniSimple;
    data['text_imlaei'] = this.textImlaei;
    data['text_imlaei_simple'] = this.textImlaeiSimple;
    data['text_indopak'] = this.textIndopak;
    return data;
  }
}

class Translation {
  int? id;
  String? text;
  int? idTranslator;

  Translation({this.id, this.text, this.idTranslator});

  Translation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    idTranslator = json['id_translator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['id_translator'] = this.idTranslator;
    return data;
  }
}

class Tafsir {
  int? id;
  String? text;

  Tafsir({this.id, this.text});

  Tafsir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }
}
