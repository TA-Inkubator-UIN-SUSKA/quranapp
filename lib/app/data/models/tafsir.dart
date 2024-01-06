//http://localhost:5000/tafsirs

class Tafsir {
  int? id;
  String? name;
  String? authorName;
  String? slug;
  String? languageName;

  Tafsir({this.id, this.name, this.authorName, this.slug, this.languageName});

  Tafsir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    authorName = json['author_name'];
    slug = json['slug'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['author_name'] = authorName;
    data['slug'] = slug;
    data['language_name'] = languageName;
    return data;
  }
}