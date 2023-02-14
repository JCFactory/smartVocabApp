import 'package:flutter/material.dart';

class VocabDataModel {
  String hindi_original;
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

  // VocabDataModel.fromJson(Map<String, dynamic> parsedJSON
  //       : hindi_original = parsedJSON['hindi_original'],
  //         hindi = parsedJSON['hindi'],
  //         english = parsedJSON['english']
  // );
 }    

final List<VocabDataModel> vocabDataModel = [
  VocabDataModel(
    hindi_original: 'मैं चाहता हूं कि आप',
    hindi: 'main chaahata hoon ki aap',
    english: 'i like you too',
    // icon: 'heart',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  VocabDataModel(
    hindi_original: 'हां आप क्या चाहते है',
    hindi: 'haan aap kya chaahate hai',
    english: 'yes what do you want',
    // icon: 'heart',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  VocabDataModel(
    hindi_original: 'मरेको आप बोहोत पसंद हूँ',
    hindi: 'mereko ap bohot pasand hoo',
    english: 'i like you very much',
    // icon: 'heart',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
];