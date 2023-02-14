import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/vocab_model.dart';
import 'firebase_options.dart';

class FirebaseServices {
// void main() async {
//  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );
//  print("success");
// }

void getDataFromFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("success");
  var db = FirebaseFirestore.instance;
  print(db.collection("vocabModel_01"));
}
  final FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;
  final List<VocabDataModel> list = [];

  // Stream<DocumentSnapshot> streamBloodpressureData(){
  //   return _fireStoreDataBase.collection('vocabModel_01').doc('d6YHiDajqWrzO4Z31dVj').snapshots();
  // }


  // List<VocabDataModel> getAllVocabDocs(DocumentSnapshot snapshot){
  //     FirebaseFirestore.instance
  //       .collection('vocabModel_01')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //           querySnapshot.docs.forEach((doc) {
  //               print(doc);
  //           });
  // });


    //   List<VocabDataModel> docSnapList = [];
    //   for(var docSnap in allVocabDocs){
    //     docSnapList.add(VocabDataModel.fromJson(docSnap.data()));
    //   }
    //   return docSnapList;

  // void main(){
  //   FirebaseFirestore.instance
  //   .collection('vocabModel_01')
  //   .get()
  //   .then((QuerySnapshot querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //           print(hindi_original);
  //           print(hindi);
  //           print(english);
  //       });
  //   });
  // }
}