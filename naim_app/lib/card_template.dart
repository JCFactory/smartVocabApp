import 'package:flutter/material.dart';

import './model/vocab_model.dart';

class CardTemplate extends StatelessWidget {
  final VocabDataModel cardDataModel;

  const CardTemplate(
    this.cardDataModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: cardDataModel.color,
                ),
              ),
              alignment: Alignment.center,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cardDataModel.synonymList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      cardDataModel.synonymList[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
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
                  cardDataModel.topic,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  cardDataModel.explanation,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 5),

                cardDataModel.icon,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
