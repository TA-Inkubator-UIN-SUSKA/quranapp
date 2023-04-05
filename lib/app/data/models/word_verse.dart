// http://localhost:5000/verses/by_chapter/1?translation=33&tafsir=1&recitation=7&words=true

class WordVerse {
  int? idVerse;
  int? idJuz;
  int? idChapter;
  int? numberInChapter;
  String? transliteration;
  Text? text;
  Translation? translation;
  Audio? audio;
  Tafsir? tafsir;
  List<Words>? words;

  WordVerse(
      {this.idVerse,
      this.idJuz,
      this.idChapter,
      this.numberInChapter,
      this.transliteration,
      this.text,
      this.translation,
      this.audio,
      this.tafsir,
      this.words});

  WordVerse.fromJson(Map<String, dynamic> json) {
    idVerse = json['id_verse'];
    idJuz = json['id_juz'];
    idChapter = json['id_chapter'];
    numberInChapter = json['number_in_chapter'];
    transliteration = json['transliteration'];
    text = json['text'] != null ? new Text.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? new Translation.fromJson(json['translation'])
        : null;
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
    tafsir =
        json['tafsir'] != null ? new Tafsir.fromJson(json['tafsir']) : null;
    if (json['words'] != null) {
      words = <Words>[];
      json['words'].forEach((v) {
        words!.add(new Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_verse'] = this.idVerse;
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
    if (this.audio != null) {
      data['audio'] = this.audio!.toJson();
    }
    if (this.tafsir != null) {
      data['tafsir'] = this.tafsir!.toJson();
    }
    if (this.words != null) {
      data['words'] = this.words!.map((v) => v.toJson()).toList();
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
  int? idTranslation;

  Translation({this.id, this.text, this.idTranslation});

  Translation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    idTranslation = json['id_translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['id_translation'] = this.idTranslation;
    return data;
  }
}

class Audio {
  int? id;
  String? url;
  String? idRecitation;

  Audio({this.id, this.url, this.idRecitation});

  Audio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    idRecitation = json['id_recitation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['id_recitation'] = this.idRecitation;
    return data;
  }
}

class Tafsir {
  int? id;
  String? text;
  String? idTafsir;

  Tafsir({this.id, this.text, this.idTafsir});

  Tafsir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    idTafsir = json['id_tafsir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['id_tafsir'] = this.idTafsir;
    return data;
  }
}

class Words {
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
  WordTranslations? wordTranslations;

  Words(
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
      this.idVerse,
      this.wordTranslations});

  Words.fromJson(Map<String, dynamic> json) {
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
    wordTranslations = json['word_translations'] != null
        ? new WordTranslations.fromJson(json['word_translations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text_uthmani'] = this.textUthmani;
    data['text_uthmani_simple'] = this.textUthmaniSimple;
    data['text_imlaei'] = this.textImlaei;
    data['text_imlaei_simple'] = this.textImlaeiSimple;
    data['text_indopak'] = this.textIndopak;
    data['number'] = this.number;
    data['audio'] = this.audio;
    data['transliteration'] = this.transliteration;
    data['unicode'] = this.unicode;
    data['unicode_uthmani_simple'] = this.unicodeUthmaniSimple;
    data['unicode_imlaei'] = this.unicodeImlaei;
    data['unicode_imlaei_simple'] = this.unicodeImlaeiSimple;
    data['unicode_indopak'] = this.unicodeIndopak;
    data['id_verse'] = this.idVerse;
    if (this.wordTranslations != null) {
      data['word_translations'] = this.wordTranslations!.toJson();
    }
    return data;
  }
}

class WordTranslations {
  int? id;
  String? text;
  int? idLanguage;
  int? idWordVerse;

  WordTranslations({this.id, this.text, this.idLanguage, this.idWordVerse});

  WordTranslations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    idLanguage = json['id_language'];
    idWordVerse = json['id_word_verse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['id_language'] = this.idLanguage;
    data['id_word_verse'] = this.idWordVerse;
    return data;
  }
}
