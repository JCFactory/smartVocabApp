// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../model/vocab_model.dart';
// import 'firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';

// class FirebaseServices {
//   void main() {
//     initializeFirebaseDB();
//   }

// // initialize db
//   void initializeFirebaseDB() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     print("success");
//   }

// // connect to db
//   final FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;
//   final List<VocabDataModel> list = [];

// // create stream
//   Stream<DocumentSnapshot> streamVocabData() {
//     // return _fireStoreDataBase
//     //     .collection('vocabModel_01').get();
//   }

//   List<VocabDataModel> getAllVocabDocs(QuerySnapshot snapshot) {
//     final allVocabDocs = snapshot.docs;
//     List<VocabDataModel> docSnapList = [];
//     for (var docSnap in allVocabDocs) {
//       print(docSnap.data());
//       // docSnapList.add(VocabDataModel.fromJson(docSnap.data()));
//     }
//     return docSnapList;
//   }

//   // List<VocabDataModel> getAllVocabDocs(DocumentSnapshot snapshot){
//   //     FirebaseFirestore.instance
//   //       .collection('vocabModel_01')
//   //       .get()
//   //       .then((QuerySnapshot querySnapshot) {
//   //           querySnapshot.docs.forEach((doc) {
//   //               print(doc);
//   //           });
//   // });

//   //   List<VocabDataModel> docSnapList = [];
//   //   for(var docSnap in allVocabDocs){
//   //     docSnapList.add(VocabDataModel.fromJson(docSnap.data()));
//   //   }
//   //   return docSnapList;

//   // void main(){
//   //   FirebaseFirestore.instance
//   //   .collection('vocabModel_01')
//   //   .get()
//   //   .then((QuerySnapshot querySnapshot) {
//   //       querySnapshot.docs.forEach((doc) {
//   //           print(hindi_original);
//   //           print(hindi);
//   //           print(english);
//   //       });
//   //   });
//   // }
// }
