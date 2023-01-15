import 'dart:developer';

import 'package:esraaabdrabo/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlayController());
  }
}

class PlayController extends StatefulWidget {
  const PlayController({super.key});

  @override
  State<PlayController> createState() => _PlayControllerState();
}

class _PlayControllerState extends State<PlayController> {
  Color greyColor = const Color.fromARGB(255, 25, 25, 25);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => PlayControllerVM(),
      builder: (context, child) {
        PlayControllerVM provider = Provider.of(context);
        return Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            provider.result != ""
                ? Image.asset(
                    provider.result,
                    height: screenHeight * .15,
                  )
                : SizedBox(
                    height: screenHeight * .15,
                  ),
            CircleAvatar(
              radius: 250,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [greyColor, Colors.white],
                        radius: 7,
                        center: Alignment.bottomCenter),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(-3, -3),
                          color: Color.fromARGB(255, 93, 93, 93),
                          blurRadius: 3),
                      BoxShadow(
                          offset: Offset(3, 3),
                          color: Color.fromARGB(255, 93, 93, 93),
                          blurRadius: 3)
                    ],
                    shape: BoxShape.circle),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    provider.showMoves
                        ? Stack(
                            children: [
                              //tri
                              move(
                                provider,
                                1,
                                "lib/images/triangle.png",
                                Alignment.topCenter,
                              ),
                              //x
                              move(
                                provider,
                                3,
                                "lib/images/x.png",
                                Alignment.bottomCenter,
                              ),
                              //circle
                              move(
                                provider,
                                0,
                                "lib/images/circle.png",
                                Alignment.centerLeft,
                              ),
                              //square
                              move(
                                provider,
                                2,
                                "lib/images/square.png",
                                Alignment.centerRight,
                              ),
                            ],
                          )
                        : const SizedBox(),
                    Draggable(
                        onDragStarted: () {
                          provider.changeShowMoves(true);
                        },
                        onDraggableCanceled: (velocity, offset) {
                          provider.changeShowMoves(false);
                        },
                        data: "esraa",
                        rootOverlay: true,
                        //ال ويدجت الاساسية هتتبدل بدة لما يتسحب
                        childWhenDragging: const SizedBox(),
                        feedback: controllBTN(),
                        child: controllBTN()),
                  ],
                ),
              ),
            ) //x
            ,
          ],
        ));
      },
    );
  }

  controllBTN() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(boxShadow: [
        const BoxShadow(
            offset: Offset(3, 3), color: Colors.black, blurRadius: 5),
        const BoxShadow(
            offset: Offset(-3, -3), color: Colors.black, blurRadius: 5),
        BoxShadow(offset: const Offset(1, 1), color: greyColor),
      ], shape: BoxShape.circle, color: const Color.fromARGB(255, 82, 82, 82)),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
                center: Alignment.bottomLeft,
                radius: 5,
                colors: [
                  greyColor,
                  const Color.fromARGB(255, 160, 160, 160),
                ])),
      ),
    );
  }

  move(PlayControllerVM provider, int moveIndex, String imgPath,
      AlignmentGeometry align) {
    return Align(
      alignment: align,
      child: DragTarget(
        //when enter display triangle
        onMove: (details) {
          provider.changeResult(moveIndex);
        },
        //when leave x dissapeared

        onLeave: (data) => provider.clearResult(),

        builder: (context, acceptedData, rejectedData) {
          return Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              const BoxShadow(
                  offset: Offset(3, 3), color: Colors.black, blurRadius: 5),
              const BoxShadow(
                  offset: Offset(-3, -3), color: Colors.black, blurRadius: 5),
              BoxShadow(offset: const Offset(1, 1), color: greyColor),
            ]),
            height: 80,
            width: 80,
            child: Image.asset(imgPath),
          );
        },
      ),
    );
  }
}
