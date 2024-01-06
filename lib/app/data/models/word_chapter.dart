// http://localhost:5000/verses/by_chapter/1?translation=17&tafsir=1&recitation=7&words=true

class WordChapter {
  int? id;
  int? verseNumber;
  String? verseKey;
  int? hizbNumber;
  int? rubElHizbNumber;
  int? rukuNumber;
  int? manzilNumber;
  String? textUthmani;
  int? pageNumber;
  int? juzNumber;
  List<Words>? words;

  WordChapter(
      {this.id,
      this.verseNumber,
      this.verseKey,
      this.hizbNumber,
      this.rubElHizbNumber,
      this.rukuNumber,
      this.manzilNumber,
      this.textUthmani,
      this.pageNumber,
      this.juzNumber,
      this.words});

  WordChapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseNumber = json['verse_number'];
    verseKey = json['verse_key'];
    hizbNumber = json['hizb_number'];
    rubElHizbNumber = json['rub_el_hizb_number'];
    rukuNumber = json['ruku_number'];
    manzilNumber = json['manzil_number'];
    textUthmani = json['text_uthmani'];
    pageNumber = json['page_number'];
    juzNumber = json['juz_number'];
    if (json['words'] != null) {
      words = <Words>[];
      json['words'].forEach((v) {
        words!.add(Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['verse_number'] = verseNumber;
    data['verse_key'] = verseKey;
    data['hizb_number'] = hizbNumber;
    data['rub_el_hizb_number'] = rubElHizbNumber;
    data['ruku_number'] = rukuNumber;
    data['manzil_number'] = manzilNumber;
    data['text_uthmani'] = textUthmani;
    data['page_number'] = pageNumber;
    data['juz_number'] = juzNumber;
    if (words != null) {
      data['words'] = words!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Words {
  int? id;
  int? position;
  String? audioUrl;
  String? charTypeName;
  int? pageNumber;
  int? lineNumber;
  String? text;
  Translation? translation;
  Translation? transliteration;

  Words(
      {this.id,
      this.position,
      this.audioUrl,
      this.charTypeName,
      this.pageNumber,
      this.lineNumber,
      this.text,
      this.translation,
      this.transliteration});

  Words.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    audioUrl = json['audio_url'];
    charTypeName = json['char_type_name'];
    pageNumber = json['page_number'];
    lineNumber = json['line_number'];
    text = json['text'];
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    transliteration = json['transliteration'] != null
        ? Translation.fromJson(json['transliteration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['position'] = position;
    data['audio_url'] = audioUrl;
    data['char_type_name'] = charTypeName;
    data['page_number'] = pageNumber;
    data['line_number'] = lineNumber;
    data['text'] = text;
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    if (transliteration != null) {
      data['transliteration'] = transliteration!.toJson();
    }
    return data;
  }
}

class Translation {
  String? text;
  String? languageName;
  int? languageId;

  Translation({this.text, this.languageName, this.languageId});

  Translation.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    languageName = json['language_name'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['language_name'] = languageName;
    data['language_id'] = languageId;
    return data;
  }
}
