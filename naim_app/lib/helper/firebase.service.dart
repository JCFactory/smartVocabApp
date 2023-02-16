import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/vocab_model.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseServices {
  final FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  void main() {
    print("firebase services work");
    initializeFirebaseDB();
  }

// initialize db
  void initializeFirebaseDB() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("success");
  }

// create stream
  Stream<QuerySnapshot> streamVocabData() {
    return _fireStoreDataBase
        .collection('vocabModel_01').snapshots();
  }

  //  VocabDataModel parsingVocab(QuerySnapshot snapshot){
  //   final data = snapshot.docs.first;
  //   return VocabDataModel.fromJson(data.data());
  // }

  // List<VocabDataModel> getAllVocabDocs(QuerySnapshot snapshot){
  //   final allVocabDocs = snapshot.docs;
  //   List<VocabDataModel> docSnapList = [];

  //     for(var docSnap in allVocabDocs){
  //       print(docSnap);
  //       docSnapList.add(VocabDataModel.fromJson(docSnap.data()));
  //     }
  //     return docSnapList;
  // }

// var map = Map<String, dynamic>.from(snap.snapshot.value as Map<dynamic, dynamic>);
}
