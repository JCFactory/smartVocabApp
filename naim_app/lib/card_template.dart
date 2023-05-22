import 'package:flutter/material.dart';
import './model/vocab_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CardTemplate extends StatelessWidget {
  final VocabDataModel cardDataModel;

  const CardTemplate(
    this.cardDataModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: cardDataModel.color,
                ),
              ),
              alignment: Alignment.center,
              child: ListView.builder(
                    itemCount: cardDataModel.hindi_original.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            cardDataModel.hindi_original[index],
                              style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              ),
                          ),
                        ],
                      );
                    },
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  cardDataModel.hindi,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  cardDataModel.english,
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
