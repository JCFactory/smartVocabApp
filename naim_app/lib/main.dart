import 'card_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import './model/vocab_model.dart';

 main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Example(),
  ));
}

class Example extends StatefulWidget {
 const Example({
    Key? key, 
  }) : super(key: key);
   @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final CardSwiperController controller = CardSwiperController();

 @override
  Widget build(BuildContext context) {    
   
    final cards = myList.map((dataModel) => CardTemplate(dataModel)).toList();

      if(myList.isNotEmpty){
        return Scaffold(
            appBar: AppBar(
              title: const Text('ScienTastic'),
              backgroundColor: Color(0xfff6c800),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: () => 
                    showDialog(
                            context: context,
                            builder: (context){
                              return  AlertDialog(
                                  title: const Text('Disclaimer'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('This application includes some expressions from the following book:'), 
                                        Text('Science research writing for non-native speakers of English (Hilary Glasman-Deal, 2009)'),
                                        Text('ISBN-13: 978-1848163102'),
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
                        }
                    ),               
                )],),
            body: SafeArea(
              child: Column (
                children: [
                  Flexible(
                    child: CardSwiper(
                      controller: controller,
                      cards: cards,
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
                          onPressed: controller.swipe,
                          child: const Icon(Icons.rotate_right),
                          backgroundColor: Color(0xfff6c800),
                        ),
                        FloatingActionButton(
                          onPressed: controller.swipeLeft,
                          child: const Icon(Icons.keyboard_arrow_left),
                          backgroundColor: Color(0xfff6c800),
                        ),
                        FloatingActionButton(
                          onPressed: controller.swipeRight,
                          child: const Icon(Icons.keyboard_arrow_right),
                          backgroundColor: Color(0xfff6c800),
                        ),
                        FloatingActionButton(
                          onPressed: controller.swipeTop,
                          child: const Icon(Icons.keyboard_arrow_up),
                          backgroundColor: Color(0xfff6c800),
                        ),
                        FloatingActionButton(
                          onPressed: controller.swipeBottom,
                          child: const Icon(Icons.keyboard_arrow_down),
                          backgroundColor: Color(0xfff6c800),
                        ),
                      ],
                    ),
                  )
                ],
              )
            )
          );
      } else {
        return Text("loading");
      }
  }

  void _swipe(int index, CardSwiperDirection direction) {
    debugPrint('the card $index was swiped to the: ${direction.name}');
  }

  @override
  void initState() {
    super.initState();
  }
}
