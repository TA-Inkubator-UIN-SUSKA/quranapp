// https://api.mfikridev.xyz/chapters?language=id

import 'dart:convert';

String surahToJson(Surah data) => json.encode(data.toJson());

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
        ? TranslatedName.fromJson(json['translated_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number_chapter'] = numberChapter;
    data['arabic_name'] = arabicName;
    data['revelation_order'] = revelationOrder;
    data['revelation_place'] = revelationPlace;
    data['verse_count'] = verseCount;
    if (translatedName != null) {
      data['translated_name'] = translatedName!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language_name'] = languageName;
    data['translation'] = translation;
    return data;
  }
}
