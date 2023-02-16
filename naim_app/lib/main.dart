import 'card_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './helper/firebase_options.dart';
import './helper/firebase.service.dart';
import 'dart:async';
import './model/vocab_model.dart';

void main() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("success");
  print('-- main: Firebase.initializeApp');
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Example(),
  ));

}

// void initializeFirebaseDB() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }

// void getDataFromFirebase() async {
//       await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform,
//       );
//       var db = FirebaseFirestore.instance;

//       // print(db.collection('vocabModel_01').get());

//       // print(db.collection("vocabModel_01").get());
//       db.collection("vocabModel_01").get().then((QuerySnapshot querySnapshot) {
//         querySnapshot.docs.forEach((doc) {
//           print(doc.get("english"));

//           list.add(VocabDataModel(
//               hindi_original: doc.get("hindi_original"),
//               hindi: doc.get("hindi"),
//               english: doc.get("english"),
//           print(list);
//         });
//       });
//     }



class Example extends StatefulWidget {
 const Example({
    Key? key,
  }) : super(key: key);
   @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final CardSwiperController controller = CardSwiperController();
  // FirebaseServices _firebaseServices = FirebaseServices();
  // final cards = vocabDataModel.map((list) => CardTemplate(list)).toList();

  //   List<VocabDataModel> getAllVocabDocs(QuerySnapshot snapshot){
  //   final allVocabDocs = snapshot.docs;
  //   List<VocabDataModel> docSnapList = [];

  //     for(var docSnap in allVocabDocs){
  //       print(docSnap);
  //       docSnapList.add(VocabDataModel.fromJson(docSnap.docdata()));
  //     }
  //     return docSnapList;
  // }

  void getDataFromFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  }

 @override
  Widget build(BuildContext context) {
    this.getDataFromFirebase();

    // Firebase.initializeApp();

    CollectionReference vocabs = FirebaseFirestore.instance.collection('vocabModel_01');

    return FutureBuilder<DocumentSnapshot>(
      future: vocabs.doc("1WvAvgKm6vad7aYZ5q6p").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {

          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          // final cards = data.map((candidate) => CardTemplate(candidate)).toList();

          return Text("hindi ${data['hindi']} english ${data['english']}");
          // return Scaffold(
          //   body: SafeArea(
          //     child: Column(
          //       children: [
          //         Flexible(
          //           child: CardSwiper(
          //             controller: controller,
          //             cards: cards,
          //             onSwipe: _swipe,
          //             padding: const EdgeInsets.all(24.0),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 16.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               FloatingActionButton(
          //                 onPressed: controller.swipe,
          //                 child: const Icon(Icons.rotate_right),
          //               ),
          //               FloatingActionButton(
          //                 onPressed: controller.swipeLeft,
          //                 child: const Icon(Icons.keyboard_arrow_left),
          //               ),
          //               FloatingActionButton(
          //                 onPressed: controller.swipeRight,
          //                 child: const Icon(Icons.keyboard_arrow_right),
          //               ),
          //               FloatingActionButton(
          //                 onPressed: controller.swipeTop,
          //                 child: const Icon(Icons.keyboard_arrow_up),
          //               ),
          //               FloatingActionButton(
          //                 onPressed: controller.swipeBottom,
          //                 child: const Icon(Icons.keyboard_arrow_down),
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // );
        }

        return Text("loading");
      },
    );
    // return Scaffold(
    //   body: 
    //   StreamBuilder<QuerySnapshot>(
    //      stream: FirebaseFirestore.instance.collection("vocabModel_01").snapshots(),
    //      builder: (context, AsyncSnapshot snapshot) {  
    //       List<VocabDataModel> allVocabs = this.getAllVocabDocs(snapshot.data);
    //       return !snapshot.hasData
    //                 ? Text('PLease Wait')
    //                 : ListView.builder(
    //                     itemCount: allVocabs.length,
    //                     itemBuilder: (context, index) {
    //                       print(snapshot);
    //                       DocumentSnapshot vocabs =
    //                           snapshot.data!.docs[index].data();
    //                           print(vocabs);
    //               return SafeArea(
    //                 child: Column(
    //                   children: [
    //                       Container(
    //                         clipBehavior: Clip.hardEdge,
    //                         decoration: BoxDecoration(
    //                           borderRadius: const BorderRadius.all(Radius.circular(10)),
    //                           color: Colors.white,
    //                           boxShadow: [
    //                             BoxShadow(
    //                               color: Colors.grey.withOpacity(0.2),
    //                               spreadRadius: 3,
    //                               blurRadius: 7,
    //                               offset: const Offset(0, 3),
    //                             )
    //                           ],
    //                         ),
    //                         alignment: Alignment.center,
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Expanded(
    //                               child: Container(
    //                                 decoration: BoxDecoration(
    //                                   gradient: LinearGradient(
    //                                     begin: Alignment.topCenter,
    //                                     end: Alignment.bottomCenter,
    //                                     colors: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
    //                                   ),
    //                                 ),
    //                                 alignment: Alignment.center,
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //                                     Text(
    //                                       allVocabs.elementAt(index).hindi_original,
    //                                       style: const TextStyle(
    //                                         color: Colors.black,
    //                                         fontWeight: FontWeight.bold,
    //                                         fontSize: 20,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding: const EdgeInsets.all(24),
    //                               child: Column(
    //                                 crossAxisAlignment: CrossAxisAlignment.start,
    //                                 children: [
    //                                   const SizedBox(height: 5),
    //                                   Text(
    //                                    allVocabs.elementAt(index).hindi,
    //                                     style: const TextStyle(
    //                                       color: Colors.blue,
    //                                       fontSize: 20,
    //                                     ),
    //                                   ),
    //                                   const SizedBox(height: 5),
    //                                   Text(
    //                                     allVocabs.elementAt(index).english,
    //                                     style: const TextStyle(
    //                                       color: Colors.grey,
    //                                       fontSize: 20,
    //                                     ),
    //                                   ),
    //                                   const SizedBox(height: 5),
    //                                   Icon(
    //                                     Icons.favorite,
    //                                     color: Colors.pink,
    //                                     size: 32.0,
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.symmetric(vertical: 16.0),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                           children: [
    //                             FloatingActionButton(
    //                               onPressed: controller.swipe,
    //                               child: const Icon(Icons.rotate_right),
    //                             ),
    //                             FloatingActionButton(
    //                               onPressed: controller.swipeLeft,
    //                               child: const Icon(Icons.keyboard_arrow_left),
    //                             ),
    //                             FloatingActionButton(
    //                               onPressed: controller.swipeRight,
    //                               child: const Icon(Icons.keyboard_arrow_right),
    //                             ),
    //                             FloatingActionButton(
    //                               onPressed: controller.swipeTop,
    //                               child: const Icon(Icons.keyboard_arrow_up),
    //                             ),
    //                             FloatingActionButton(
    //                               onPressed: controller.swipeBottom,
    //                               child: const Icon(Icons.keyboard_arrow_down),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                   ],
    //                 ),
    //               ); 
    //             },
    //           );
    //       },
    //   ),           
    // );
  }

  void _swipe(int index, CardSwiperDirection direction) {
    debugPrint('the card $index was swiped to the: ${direction.name}');
  }

  @override
  void initState() {
    super.initState();
  }
}
