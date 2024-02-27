class HijriahDate {
  String? hari;
  String? hariJawa;
  String? tanggalHijriyah;
  String? bulanHijriyah;
  String? tahunHijriyah;
  String? tanggalMasehi;
  String? bulanMasehi;
  String? tahunMasehi;
  String? acaranya;
  String? puasanya;
  String? puasanya2;

  HijriahDate(
      {this.hari,
      this.hariJawa,
      this.tanggalHijriyah,
      this.bulanHijriyah,
      this.tahunHijriyah,
      this.tanggalMasehi,
      this.bulanMasehi,
      this.tahunMasehi,
      this.acaranya,
      this.puasanya,
      this.puasanya2});

  HijriahDate.fromJson(Map<String, dynamic> json) {
    hari = json['hari'];
    hariJawa = json['hari_jawa'];
    tanggalHijriyah = json['tanggal_hijriyah'];
    bulanHijriyah = json['bulan_hijriyah'];
    tahunHijriyah = json['tahun_hijriyah'];
    tanggalMasehi = json['tanggal_masehi'];
    bulanMasehi = json['bulan_masehi'];
    tahunMasehi = json['tahun_masehi'];
    acaranya = json['acaranya'];
    puasanya = json['puasanya'];
    puasanya2 = json['puasanya2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hari'] = hari;
    data['hari_jawa'] = hariJawa;
    data['tanggal_hijriyah'] = tanggalHijriyah;
    data['bulan_hijriyah'] = bulanHijriyah;
    data['tahun_hijriyah'] = tahunHijriyah;
    data['tanggal_masehi'] = tanggalMasehi;
    data['bulan_masehi'] = bulanMasehi;
    data['tahun_masehi'] = tahunMasehi;
    data['acaranya'] = acaranya;
    data['puasanya'] = puasanya;
    data['puasanya2'] = puasanya2;
    return data;
  }
}
