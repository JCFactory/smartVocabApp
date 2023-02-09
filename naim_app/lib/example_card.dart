import 'package:flutter/material.dart';

import 'example_candidate_model.dart';

class ExampleCard extends StatelessWidget {
  final ExampleVocabModel candidate;

  const ExampleCard(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      // add appbar with app naim translator / nice translator
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
            //     width: 100.00,
            //     height: 100.00,
            //     decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: ExactAssetImage('assets/testimage.JPG'),
            //         fit: BoxFit.fitHeight,
            //         ),
            // )),
            // Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: candidate.color,
                ),
              ),
              alignment: Alignment.center,
              child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(candidate.hindi_original,
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
                  candidate.hindi,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
                  const SizedBox(height: 5),
                Text(
                  candidate.english,
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