// https://api.qurancdn.com/api/qdc/verses/by_chapter/1?words=true&per_page=all&fields=text_uthmani&word_translation_language=id

class Verse {
  int? id;
  int? position;
  String? audioUrl;
  String? charTypeName;
  int? pageNumber;
  int? lineNumber;
  String? text;
  Translation? translation;
  Translation? transliteration;

  Verse(
      {this.id,
      this.position,
      this.audioUrl,
      this.charTypeName,
      this.pageNumber,
      this.lineNumber,
      this.text,
      this.translation,
      this.transliteration});

  Verse.fromJson(Map<String, dynamic> json) {
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
