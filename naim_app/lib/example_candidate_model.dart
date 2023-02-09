import 'package:flutter/cupertino.dart';

class ExampleVocabModel {
  String hindi_original;
  String hindi;
  String english;
//   String icon;
  List<Color> color;

  ExampleVocabModel({
    required this.hindi_original,
    required this.hindi,
    required this.english,
    // required this.icon, // TODO: change dynamically to categories
    required this.color,
  });
}

final List<ExampleVocabModel> candidates = [
  ExampleVocabModel(
    hindi_original: 'मैं चाहता हूं कि आप',
    hindi: 'main chaahata hoon ki aap',
    english: 'i like you too',
    // icon: 'heart',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  ExampleVocabModel(
    hindi_original: 'हां आप क्या चाहते है',
    hindi: 'haan aap kya chaahate hai',
    english: 'yes what do you want',
    // icon: 'heart',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  ExampleVocabModel(
    hindi_original: 'मरेको आप बोहोत पसंद हूँ',
    hindi: 'mereko ap bohot pasand hoo',
    english: 'i like you very much',
    // icon: 'heart',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  ExampleVocabModel(
    hindi_original: 'मैं चाहता हूं कि आप',
    hindi: 'main chaahata hoon ki aap',
    english: 'i like you too',
    // icon: 'heart',
    color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
  ),
];