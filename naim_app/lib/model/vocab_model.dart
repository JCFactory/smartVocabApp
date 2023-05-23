import 'package:flutter/material.dart';

class VocabDataModel {
  List<String> synonym_list;
  String topic;
  String explanation;
  List<Color> color;
  Icon icon;


  VocabDataModel({
    required this.synonym_list,
    required this.topic,
    required this.explanation,
    required this.color,
    required this.icon,
  });

  VocabDataModel.fromJson(Map<String, dynamic> parsedJSON)
      : synonym_list = _parseSynonymList(parsedJSON['synonym_list']),
        topic = parsedJSON['topic'],
        explanation = parsedJSON['explanation'],
        color = _parseColorList(parsedJSON['color']),
        icon = parsedJSON['icon'];

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
    synonym_list: ['in addition', 
    'moreover', 'furthermore', 'apart from that/which','Not only, but also...', 
    'Similarly,...', 'Notably,...', 'also', 'secondly', 'In the second place',
    'What is more', 'Specifically,...', 'Besides (more powerful)'],
    topic: 'ADDITION',
    explanation: 'some additional fact',
    icon: Icon(Icons.add, color: Colors.blue, size: 32.0),
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  VocabDataModel(
    synonym_list: ['..., such as', 'for instance', 'for example', 'e.g.'],
    topic: 'EXAMPLE',
    explanation: 'give an example',
    icon: Icon(Icons.tips_and_updates, color: Colors.green, size: 32.0),
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  VocabDataModel(
    synonym_list: ['however', 'whereas', 'but', 'otherwise', 'Unlike the other, ...', 
    'on the other hand', 'while', 'by contrast', 'In comparison,...'
    ],
    topic: 'CONTRAST / DIFFERENCE',
    explanation: 'explain the difference of two things',
    icon: Icon(Icons.contrast, color: Colors.pink, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),           
  VocabDataModel(
    synonym_list: ['Although', 'Even though', 'Though', 'Despite', 'In spite of', 
    'Regardless of', 'Notwithstanding', 'Nevertheless', 'However', 'yet', 'nonetheless', 'even so'],
    topic: 'UNEXPECTEDNESS',
    explanation: 'express the suprise',
    icon: Icon(Icons.sunny, color: Colors.yellow, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  VocabDataModel(
    synonym_list: ['Remarkably,', 'In particular,', 'More strikingly', 'In these settings', 
    'As a specific prerequisite to this grant, '],
    topic: 'EMPHASIS',
    explanation: 'highlight some important fact',
    icon: Icon(Icons.electric_bolt, color: Colors.black, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  VocabDataModel(
    synonym_list: ['Due to (the fact that),', 'on account of (the fact that),', 
    'in view of (the fact that)', 'Given that..., the', 'as', 'because', 'since'],
    topic: 'CAUSE',
    explanation: 'explain why something is happening',
    icon: Icon(Icons.account_tree, color: Colors.green, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  VocabDataModel(
    synonym_list: ['Therefore', 'consequently', 
    'hence', 'thus', 'In the future, (we hope)', 'The present study demonstrated that.../the utility of...', 
    'as a result of which', 'which is why', 'so (between two sentences, not at the start)', 'if X then Y'],
    topic: 'RESULTS',
    explanation: 'explain the results of your experiment',
    icon: Icon(Icons.flag_circle, color: Colors.pink, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  VocabDataModel(
    synonym_list: ['XYZ is different from that seen in ABC. In ABC, the total number of...',
    'it / they', 'this method / these systems', 'this combination of', 'relative clause: which', 
    'At recurrence,', 'Within the same study,', 'During this,', 'While awaiting the..., XY was identified', 
    'Predominantly,', 'In the presence of an increasingly expansive and complex...',
    'The following supporting information can be...', 'It remains challenging, however, to (interpret)',
    'In response to this...' ],
    topic: 'CONNECTOR',
    explanation: 'connect one sentence to another',
    icon: Icon(Icons.link, color: Colors.orange, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  VocabDataModel(
    synonym_list: ['In case of ..., the ... can be supplemented.', 'To substitute for...',
    'All ... analysis techniques are either already established in ... or', 
    'To supplement for', 'Apart from that, ... has been established for reduction of / in order to reduce...',
    'Furthermore, ... has been routinely established.'
    ],
    topic: 'RISKS / POTENTIAL PITFALLS',
    explanation: 'explain the possible risks and preventive actions',
    icon: Icon(Icons.cookie, color: Colors.orange, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
   VocabDataModel(
    synonym_list: ['XYZ have been broadly investigated on...', 'Although intuitive and functionally demonstrated in ... models',
    '...these mechanisms have rarely been validated in real life.', 
    'Recent progress in NGS has inspired a multitude of DNA and RNA sequencing studies'
    ],
    topic: 'INTRODUCTION',
    explanation: 'introduce your topic and show the importance',
    icon: Icon(Icons.psychology, color: Colors.orange, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  VocabDataModel(
    synonym_list: ['essential', 'needed', 'mandatory', 'compulsory', 
    'requisite', 'imperative', 'obligatory', 'vital', 'demanded'
    ],
    topic: 'NECESSARY',
    explanation: 'some synonyms',
    icon: Icon(Icons.link, color: Colors.red, size: 32.0),
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  ];



