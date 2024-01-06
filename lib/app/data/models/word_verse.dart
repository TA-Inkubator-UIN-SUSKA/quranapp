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
    text = json['text'] != null ? Text.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
    tafsir =
        json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null;
    if (json['words'] != null) {
      words = <Words>[];
      json['words'].forEach((v) {
        words!.add(Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_verse'] = idVerse;
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
    if (audio != null) {
      data['audio'] = audio!.toJson();
    }
    if (tafsir != null) {
      data['tafsir'] = tafsir!.toJson();
    }
    if (words != null) {
      data['words'] = words!.map((v) => v.toJson()).toList();
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
  int? idTranslation;

  Translation({this.id, this.text, this.idTranslation});

  Translation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    idTranslation = json['id_translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['id_translation'] = idTranslation;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['id_recitation'] = idRecitation;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['id_tafsir'] = idTafsir;
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
        ? WordTranslations.fromJson(json['word_translations'])
        : null;
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
    if (wordTranslations != null) {
      data['word_translations'] = wordTranslations!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['id_language'] = idLanguage;
    data['id_word_verse'] = idWordVerse;
    return data;
  }
}
