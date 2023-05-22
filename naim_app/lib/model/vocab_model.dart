import 'package:flutter/material.dart';

class VocabDataModel {
  List<String> hindi_original;
  String hindi;
  String english;
  List<Color> color;
  //   String icon;


  VocabDataModel({
    required this.hindi_original,
    required this.hindi,
    required this.english,
    required this.color,
        // required this.icon, // TODO: change dynamically to categories
  });

  VocabDataModel.fromJson(Map<String, dynamic> parsedJSON)
      : hindi_original = _parseSynonymList(parsedJSON['hindi_original']),
        hindi = parsedJSON['hindi'],
        english = parsedJSON['english'],
        color = _parseColorList(parsedJSON['color']);

 static List<String> _parseSynonymList(List<dynamic> synonymList) {
    return synonymList.map((synonymValue) => _parseSynonym(synonymValue)).toList();
  }

  static String _parseSynonym(String synonym) {
    return synonym;
  }

  static List<Color> _parseColorList(List<dynamic> colorList) {
    return colorList.map((colorValue) => _parseColor(colorValue)).toList();
  }

  static Color _parseColor(int colorValue) {
    return Color(colorValue);
  }
}

List<VocabDataModel> myList = [
    VocabDataModel(
    hindi_original: ['in addition', 'moreover', 'furthermore', 'apart from that/which','also', 'secondly'],
    hindi: 'ADDITION',
    english: 'some additional fact',
    // icon: 'heart',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  VocabDataModel(
    hindi_original: ['in addition', 'moreover'],
    hindi: 'haan aap kya chaahate hai',
    english: 'yes what do you want',
    // icon: 'heart',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  VocabDataModel(
    hindi_original: ['in addition', 'moreover'],
    hindi: 'mereko ap bohot pasand hoo',
    english: 'i like you very much',
    // icon: 'heart',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  ];

// final List<VocabDataModel> vocabDataModel = [
//   VocabDataModel(
//     hindi_original: 'मैं चाहता हूं कि आप',
//     hindi: 'main chaahata hoon ki aap',
//     english: 'i like you too',
//     // icon: 'heart',
//     color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
//   ),
//   VocabDataModel(
//     hindi_original: 'हां आप क्या चाहते है',
//     hindi: 'haan aap kya chaahate hai',
//     english: 'yes what do you want',
//     // icon: 'heart',
//     color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
//   ),
//   VocabDataModel(
//     hindi_original: 'मरेको आप बोहोत पसंद हूँ',
//     hindi: 'mereko ap bohot pasand hoo',
//     english: 'i like you very much',
//     // icon: 'heart',
//     color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
//   ),
// ];
