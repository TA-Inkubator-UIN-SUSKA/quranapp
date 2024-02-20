import 'package:quran_emufassir/app/data/models/chatbot.dart';

List<Chatbot> listChatbot = [
  Chatbot(
    title: "Chatbot Al-Qur'an",
    desc: "Sumber jawaban diambil dari\nAyat Al-Qur'an dan Terjemahan",
    image: 'assets/images/Quran.png',
    endpoint: "alquran-prompt",
    appBar: "Al Qur'an",
  ),
  Chatbot(
    title: "Chatbot Al-Azhar",
    desc: "Sumber jawaban diambil dari\nTafsir Al-Azhar",
    image: 'assets/images/Quran.png',
    endpoint: "al-azhar-prompt",
    appBar: "Al-Azhar",
  ),
  Chatbot(
    title: "Chatbot Al-Jalalain",
    desc: "Sumber jawaban diambil dari\nTafsir Al-Jalalain",
    image: 'assets/images/Quran.png',
    endpoint: "al-jalalain",
    appBar: "Al-Jalalain",
  ),
  Chatbot(
    title: "Chatbot Ibnu Katsir",
    desc: "Sumber jawaban diambil dari\nTafsir Ibnu Katsir",
    image: 'assets/images/Quran.png',
    endpoint: "ibn-kathir",
    appBar: "Ibnu Katsir",
  ),
];
