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
        words!.add(new Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['verse_number'] = this.verseNumber;
    data['verse_key'] = this.verseKey;
    data['hizb_number'] = this.hizbNumber;
    data['rub_el_hizb_number'] = this.rubElHizbNumber;
    data['ruku_number'] = this.rukuNumber;
    data['manzil_number'] = this.manzilNumber;
    data['text_uthmani'] = this.textUthmani;
    data['page_number'] = this.pageNumber;
    data['juz_number'] = this.juzNumber;
    if (this.words != null) {
      data['words'] = this.words!.map((v) => v.toJson()).toList();
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
        ? new Translation.fromJson(json['translation'])
        : null;
    transliteration = json['transliteration'] != null
        ? new Translation.fromJson(json['transliteration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    data['audio_url'] = this.audioUrl;
    data['char_type_name'] = this.charTypeName;
    data['page_number'] = this.pageNumber;
    data['line_number'] = this.lineNumber;
    data['text'] = this.text;
    if (this.translation != null) {
      data['translation'] = this.translation!.toJson();
    }
    if (this.transliteration != null) {
      data['transliteration'] = this.transliteration!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['language_name'] = this.languageName;
    data['language_id'] = this.languageId;
    return data;
  }
}
