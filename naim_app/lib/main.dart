import 'card_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './helper/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import './helper/firebase.service.dart';
import 'dart:async';
import './model/vocab_model.dart';
import 'dart:convert';

List<VocabDataModel> myList = [
    VocabDataModel(
    hindi_original: 'मैं चाहता हूं कि आप',
    hindi: 'main chaahata hoon ki aap',
    english: 'i like you too',
    // icon: 'heart',
    // color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  VocabDataModel(
    hindi_original: 'हां आप क्या चाहते है',
    hindi: 'haan aap kya chaahate hai',
    english: 'yes what do you want',
    // icon: 'heart',
    // color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  VocabDataModel(
    hindi_original: 'मरेको आप बोहोत पसंद हूँ',
    hindi: 'mereko ap bohot pasand hoo',
    english: 'i like you very much',
    // icon: 'heart',
    // color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  ];


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: 
   DefaultFirebaseOptions.currentPlatform);
   print('-- main: Firebase.initializeApp');
    Future<List<VocabDataModel>> _futureOfList = getData();
    List<VocabDataModel> list = await _futureOfList ;
    myList = list;

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Example(),
  ));
}

  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('vocabModel_01');

  
  Future<List<VocabDataModel>> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final allBPDocs = querySnapshot.docs;

    List<VocabDataModel> docSnapList = [];
        for(var docSnap in allBPDocs){
          docSnapList.add(VocabDataModel.fromJson(docSnap.data() as Map<String, dynamic>));
        }
    myList = (docSnapList);
    return docSnapList;
  }

class Example extends StatefulWidget {
 const Example({
    Key? key, 
  }) : super(key: key);
   @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final CardSwiperController controller = CardSwiperController();

//   Future<void> _showMyDialog() async {
//       return showDialog<void>(
//         context: context,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
          
//         },
//       );
// }

 @override
  Widget build(BuildContext context) {    
   
    final cards = myList.map((dataModel) => CardTemplate(dataModel)).toList();

      if(myList.isNotEmpty){
        return Scaffold(
            appBar: AppBar(
              title: const Text('Naim Vocab App'),
              backgroundColor: Color(0xfff6c800),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_alert),
                  onPressed: () => 
                    showDialog(
                            context: context,
                            builder: (context){
                              return  AlertDialog(
                                  title: const Text('AlertDialog Title'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('This is a demo alert dialog.'), // todo: display all learned vocabulary and the ones which were not learned (make two lists)
                                        Text('Would you like to approve of this message?'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Approve'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );  
                        }
                    ),               
                )],),
            body: SafeArea(
              child: Column (
                children: [
                  Flexible(
                    child: CardSwiper(
                      controller: controller,
                      cards: cards,
                      onSwipe: _swipe,
                      padding: const EdgeInsets.all(24.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: controller.swipe,
                          child: const Icon(Icons.rotate_right),
                          backgroundColor: Color(0xfff6c800),
                        ),
                        FloatingActionButton(
                          onPressed: controller.swipeLeft,
                          child: const Icon(Icons.keyboard_arrow_left),
                          backgroundColor: Color(0xfff6c800),
                        ),
                        FloatingActionButton(
                          onPressed: controller.swipeRight,
                          child: const Icon(Icons.keyboard_arrow_right),
                          backgroundColor: Color(0xfff6c800),
                        ),
                        FloatingActionButton(
                          onPressed: controller.swipeTop,
                          child: const Icon(Icons.keyboard_arrow_up),
                          backgroundColor: Color(0xfff6c800),
                        ),
                        FloatingActionButton(
                          onPressed: controller.swipeBottom,
                          child: const Icon(Icons.keyboard_arrow_down),
                          backgroundColor: Color(0xfff6c800),
                        ),
                      ],
                    ),
                  )
                ],
              )
            )
          );
      } else {
        return Text("loading");
      }
  }

  void _swipe(int index, CardSwiperDirection direction) {
    debugPrint('the card $index was swiped to the: ${direction.name}');
  }

  @override
  void initState() {
    super.initState();
  }
}
