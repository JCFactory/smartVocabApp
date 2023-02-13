import 'package:flutter/material.dart';
import './model/vocab_model.dart';
import './helper/firebase.service.dart';
import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final VocabDataModel vocabDataModel;

  const CardTemplate(
    this.vocabDataModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {          
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: 
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column (
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(vocabDataModel.hindi_original,
                                style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              ),
                              ],
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   candidate.hindi_original,
                            //   style: const TextStyle(
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 24,
                            //   ),
                            // ),
                            const SizedBox(height: 5),
                            Text(
                              vocabDataModel.hindi,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            ),
                              const SizedBox(height: 5),
                            Text(
                              vocabDataModel.english,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 32.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

      }
  }
  
