import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/vocab_model.dart';

class FirebaseServices {

  final FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;
  final List<VocabDataModel> list = [];

  Stream<DocumentSnapshot> streamBloodpressureData(){
    return _fireStoreDataBase.collection('vocabModel_01').doc('d6YHiDajqWrzO4Z31dVj').snapshots();
  }

//   List<VocabDataModel> getAllVocabDocs(DocumentSnapshot snapshot){
//       final allVocabDocs = snapshot.docs;
//       List<VocabDataModel> docSnapList = [];
//       for(var docSnap in allVocabDocs){
//         docSnapList.add(VocabDataModel.fromJson(docSnap.data()));
//       }
//       return docSnapList;
//   }

  List<VocabDataModel> getAllVocabDocs(DocumentSnapshot snapshot){
      FirebaseFirestore.instance
        .collection('vocabModel_01')
        .get()
        .then((QuerySnapshot querySnapshot) {
            querySnapshot.docs.forEach((doc) {
                print(doc);
            });
        });
    //   List<VocabDataModel> docSnapList = [];
    //   for(var docSnap in allVocabDocs){
    //     docSnapList.add(VocabDataModel.fromJson(docSnap.data()));
    //   }
    //   return docSnapList;
  }

// FirebaseFirestore.instance
//     .collection('vocabModel_01')
//     .get()
//     .then((QuerySnapshot querySnapshot) {
//         querySnapshot.docs.forEach((doc) {
//             print(hindi_original);
//             print(hindi);
//             print(english);
//         });
//     });


}