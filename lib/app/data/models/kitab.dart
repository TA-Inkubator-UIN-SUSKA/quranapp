class Kitab {
  int? id;
  String? namaKitab;
  int? rows;
  ListHadits? listHadits;
  List<Bab>? bab;

  Kitab({this.id, this.namaKitab, this.rows, this.listHadits, this.bab});

  Kitab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKitab = json['nama_kitab'];
    rows = json['rows'];
    listHadits = json['list_hadits'] != null
        ? ListHadits.fromJson(json['list_hadits'])
        : null;
    if (json['bab'] != null) {
      bab = <Bab>[];
      json['bab'].forEach((v) {
        bab!.add(Bab.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_kitab'] = namaKitab;
    data['rows'] = rows;
    if (listHadits != null) {
      data['list_hadits'] = listHadits!.toJson();
    }
    if (bab != null) {
      data['bab'] = bab!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListHadits {
  int? currentPage;
  List<Data>? data;

  ListHadits({this.currentPage, this.data});

  ListHadits.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? kitab;
  String? bab;
  String? arab;
  String? terjemah;
  int? idBab;
  int? idKitab;

  Data(
      {this.id,
      this.kitab,
      this.bab,
      this.arab,
      this.terjemah,
      this.idBab,
      this.idKitab});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kitab = json['kitab'];
    bab = json['Bab'];
    arab = json['arab'];
    terjemah = json['terjemah'];
    idBab = json['id_bab'];
    idKitab = json['id_kitab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kitab'] = kitab;
    data['Bab'] = bab;
    data['arab'] = arab;
    data['terjemah'] = terjemah;
    data['id_bab'] = idBab;
    data['id_kitab'] = idKitab;
    return data;
  }
}

class Bab {
  int? id;
  String? namaBab;

  Bab({this.id, this.namaBab});

  Bab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBab = json['nama_bab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_bab'] = namaBab;
    return data;
  }
}
