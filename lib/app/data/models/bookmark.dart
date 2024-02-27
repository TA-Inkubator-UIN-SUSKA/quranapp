import 'dart:convert';

import 'package:quran_emufassir/app/data/models/surah.dart';

class Bookmark {
  int? id;
  Surah? surah;
  int? numberSurah;
  int? ayat;
  int? juz;
  String? via;
  int? indexAyat;
  int? lastRead;

  Bookmark(
      {this.id,
      this.surah,
      this.numberSurah,
      this.ayat,
      this.juz,
      this.via,
      this.indexAyat,
      this.lastRead});

  Bookmark.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surah = json['surah'] != null
        ? Surah.fromJson(jsonDecode(json['surah']))
        : null;
    numberSurah = json['number_surah'];
    ayat = json['ayat'];
    juz = json['juz'];
    via = json['via'];
    indexAyat = json['index_ayat'];
    lastRead = json['last_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (surah != null) {
      data['surah'] = surah!.toJson();
    }
    data['number_surah'] = numberSurah;
    data['ayat'] = ayat;
    data['juz'] = juz;
    data['via'] = via;
    data['index_ayat'] = indexAyat;
    data['last_read'] = lastRead;
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
