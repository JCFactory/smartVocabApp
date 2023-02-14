import 'card_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './helper/firebase_options.dart';
// import './helper/firebase.service.dart';
import './model/vocab_model.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Example(),
  ));
  // streamStaticData();
  getDataFromFirebase();
}

List<VocabDataModel> list = [];

void getDataFromFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var db = FirebaseFirestore.instance;

  print(db.collection('vocabModel_01').get());

  // print(db.collection("vocabModel_01").get());
  db.collection("vocabModel_01").get().then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc.get("english"));

      list.add(VocabDataModel(
          hindi_original: doc.get("hindi_original"),
          hindi: doc.get("hindi"),
          english: doc.get("english"),
          color: const [Color(0xFFFF3868), Color(0xFFFFB49A)]));
      print(list);
    });
  });
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

  final cards = vocabDataModel.map((list) => CardTemplate(list)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeLeft,
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeRight,
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeTop,
                    child: const Icon(Icons.keyboard_arrow_up),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeBottom,
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _swipe(int index, CardSwiperDirection direction) {
    debugPrint('the card $index was swiped to the: ${direction.name}');
  }
}
