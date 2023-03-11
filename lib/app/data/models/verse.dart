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
  String? kondisiAudio;

  Verse(
      {this.numberInQuran,
      this.idJuz,
      this.idChapter,
      this.numberInChapter,
      this.transliteration,
      this.text,
      this.translation,
      this.tafsir, 
      this.kondisiAudio = "stop",});

  Verse.fromJson(Map<String, dynamic> json) {
    numberInQuran = json['number_in_quran'];
    idJuz = json['id_juz'];
    idChapter = json['id_chapter'];
    numberInChapter = json['number_in_chapter'];
    transliteration = json['transliteration'];
    text = json['text'] != null ? Text.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    tafsir =
        json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number_in_quran'] = numberInQuran;
    data['id_juz'] = idJuz;
    data['id_chapter'] = idChapter;
    data['number_in_chapter'] = numberInChapter;
    data['transliteration'] = transliteration;
    if (text != null) {
      data['text'] = text!.toJson();
    }
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    if (tafsir != null) {
      data['tafsir'] = tafsir!.toJson();
    }
    data["kondisiAudio"] = kondisiAudio;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text_uthmani'] = textUthmani;
    data['text_uthmani_simple'] = textUthmaniSimple;
    data['text_imlaei'] = textImlaei;
    data['text_imlaei_simple'] = textImlaeiSimple;
    data['text_indopak'] = textIndopak;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['id_translator'] = idTranslator;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    return data;
  }
}
