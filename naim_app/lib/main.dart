import 'card_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './helper/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import './helper/firebase.service.dart';
import 'dart:async';
import './model/vocab_model.dart';
import 'dart:convert';

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
              title: const Text('ScienTinder'),
              backgroundColor: Color(0xfff6c800),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_alert),
                  onPressed: () => 
                    showDialog(
                            context: context,
                            builder: (context){
                              return  AlertDialog(
                                  title: const Text('AlertDialog Title'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('This is a demo alert dialog.'), // todo: display all learned vocabulary and the ones which were not learned (make two lists)
                                        Text('Would you like to approve of this message?'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Approve'),
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
