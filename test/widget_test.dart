import 'package:quran_emufassir/app/data/models/tafsir.dart';
import 'package:quran_emufassir/app/helper/data_tafsirs.dart';

void main() async {
  String? getSourceTafsir(int idTafsir) {
    Tafsir sourceTafsir =
        listTafsir.firstWhere((element) => element.id == idTafsir);
    return sourceTafsir.name;
  }

  print(getSourceTafsir(1)!);
}
