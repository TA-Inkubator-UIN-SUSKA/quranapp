// http://localhost:5000/verses/by_chapter/2?translation=17&tafsir=2&recitation=1
class Verse {
  Verse(
      {this.numberInQuran,
      this.idJuz,
      this.idChapter,
      this.numberInChapter,
      this.transliteration,
      this.text,
      this.translation,
      this.tafsir,
      this.audio,
      this.kondisiAudio = "stop"});

  String kondisiAudio;
  int? numberInQuran;
  int? idJuz;
  int? idChapter;
  int? numberInChapter;
  String? transliteration;
  Text? text;
  Translation? translation;
  Tafsir? tafsir;
  Audio? audio;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        numberInQuran: json["number_in_quran"],
        idJuz: json["id_juz"],
        idChapter: json["id_chapter"],
        numberInChapter: json["number_in_chapter"],
        transliteration: json["transliteration"],
        text: Text.fromJson(json["text"]),
        translation: Translation.fromJson(json["translation"]),
        tafsir: Tafsir.fromJson(json["tafsir"]),
        audio: Audio.fromJson(json["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "number_in_quran": numberInQuran,
        "id_juz": idJuz,
        "id_chapter": idChapter,
        "number_in_chapter": numberInChapter,
        "transliteration": transliteration,
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "tafsir": tafsir?.toJson(),
        "audio": audio?.toJson(),
        "kondisiAudio": kondisiAudio,
      };
}

class Audio {
  Audio({
    this.id,
    this.url,
    this.idRecitation,
  });

  int? id;
  String? url;
  String? idRecitation;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        id: json["id"],
        url: json["url"],
        idRecitation: json["id_recitation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "id_recitation": idRecitation,
      };
}

class Tafsir {
  Tafsir({
    this.id,
    this.text,
    this.idTafsir,
  });

  int? id;
  String? text;
  String? idTafsir;

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
        text: json["text"],
        idTafsir: json["id_tafsir"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "id_tafsir": idTafsir,
      };
}

class Text {
  Text({
    this.textUthmani,
    this.textUthmaniSimple,
    this.textImlaei,
    this.textImlaeiSimple,
    this.textIndopak,
  });

  String? textUthmani;
  String? textUthmaniSimple;
  String? textImlaei;
  String? textImlaeiSimple;
  String? textIndopak;

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        textUthmani: json["text_uthmani"],
        textUthmaniSimple: json["text_uthmani_simple"],
        textImlaei: json["text_imlaei"],
        textImlaeiSimple: json["text_imlaei_simple"],
        textIndopak: json["text_indopak"],
      );

  Map<String, dynamic> toJson() => {
        "text_uthmani": textUthmani,
        "text_uthmani_simple": textUthmaniSimple,
        "text_imlaei": textImlaei,
        "text_imlaei_simple": textImlaeiSimple,
        "text_indopak": textIndopak,
      };
}

class Translation {
  Translation({
    this.id,
    this.text,
    this.idTranslation,
  });

  int? id;
  String? text;
  int? idTranslation;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        text: json["text"],
        idTranslation: json["id_translation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "id_translation": idTranslation,
      };
}
