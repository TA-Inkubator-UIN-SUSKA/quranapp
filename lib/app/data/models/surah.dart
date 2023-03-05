// https://api.mfikridev.xyz/chapters?language=id

class Surah {
  int? id;
  String? name;
  int? numberChapter;
  String? arabicName;
  int? revelationOrder;
  String? revelationPlace;
  int? verseCount;
  TranslatedName? translatedName;

  Surah(
      {this.id,
      this.name,
      this.numberChapter,
      this.arabicName,
      this.revelationOrder,
      this.revelationPlace,
      this.verseCount,
      this.translatedName});

  Surah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    numberChapter = json['number_chapter'];
    arabicName = json['arabic_name'];
    revelationOrder = json['revelation_order'];
    revelationPlace = json['revelation_place'];
    verseCount = json['verse_count'];
    translatedName = json['translated_name'] != null
        ? new TranslatedName.fromJson(json['translated_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number_chapter'] = this.numberChapter;
    data['arabic_name'] = this.arabicName;
    data['revelation_order'] = this.revelationOrder;
    data['revelation_place'] = this.revelationPlace;
    data['verse_count'] = this.verseCount;
    if (this.translatedName != null) {
      data['translated_name'] = this.translatedName!.toJson();
    }
    return data;
  }
}

class TranslatedName {
  String? languageName;
  String? translation;

  TranslatedName({this.languageName, this.translation});

  TranslatedName.fromJson(Map<String, dynamic> json) {
    languageName = json['language_name'];
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_name'] = this.languageName;
    data['translation'] = this.translation;
    return data;
  }
}
