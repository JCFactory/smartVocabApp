import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'card_template.dart';
import './model/vocab_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    ),
  );
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final CardSwiperController controller = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    if (myList.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('loading'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScienTastic'),
        backgroundColor: const Color(0xfff6c800),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Disclaimer'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                            'This application includes some expressions '
                            'from the following book:',
                          ),
                          Text(
                            'Science research writing for non-native '
                            'speakers of English '
                            '(Hilary Glasman-Deal, 2009)',
                          ),
                          Text(
                            'ISBN-13: 978-1848163102',
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: myList.length,

                cardBuilder: (
                  context,
                  index,
                  horizontalOffsetPercentage,
                  verticalOffsetPercentage,
                ) {
                  return CardTemplate(myList[index]);
                },

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
                    onPressed: () {
                      controller.undo();
                    },
                    backgroundColor: const Color(0xfff6c800),
                    child: const Icon(Icons.rotate_right),
                  ),

                  FloatingActionButton(
                    onPressed: () {
                      controller.swipe(CardSwiperDirection.left);
                    },
                    backgroundColor: const Color(0xfff6c800),
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),

                  FloatingActionButton(
                    onPressed: () {
                      controller.swipe(CardSwiperDirection.right);
                    },
                    backgroundColor: const Color(0xfff6c800),
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),

                  FloatingActionButton(
                    onPressed: () {
                      controller.swipe(CardSwiperDirection.top);
                    },
                    backgroundColor: const Color(0xfff6c800),
                    child: const Icon(Icons.keyboard_arrow_up),
                  ),

                  FloatingActionButton(
                    onPressed: () {
                      controller.swipe(CardSwiperDirection.bottom);
                    },
                    backgroundColor: const Color(0xfff6c800),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }

  bool _swipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'Card $previousIndex wurde nach ${direction.name} geswiped.',
    );

    debugPrint(
      'Neue Karte: $currentIndex',
    );

    return true;
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
