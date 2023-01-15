import 'dart:developer';

import 'package:esraaabdrabo/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Color greyColor = const Color.fromARGB(255, 25, 25, 25);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Game Controller',
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
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => PlayControllerVM(),
      builder: (context, child) {
        PlayControllerVM provider = Provider.of(context);
        return Scaffold(
          backgroundColor: Colors.black,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return constraints.maxWidth > 700
                  ?
                  //lab
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //show the moveBTN image or empty space
                        provider.result != ""
                            ? Image.asset(
                                provider.result,
                                width: screenHeight * .5,
                              )
                            : SizedBox(
                                width: screenHeight * .5,
                              ),
                        Controller(provider),
                      ],
                    )
                  : Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //show the moveBTN image or empty space
                        provider.result != ""
                            ? Image.asset(
                                provider.result,
                                height: screenHeight * .15,
                              )
                            : SizedBox(
                                height: screenHeight * .15,
                              ),
                        SizedBox(
                            height: screenHeight * .7,
                            child: Controller(provider)),
                      ],
                    );
            },
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class MoveBTN extends StatelessWidget {
  PlayControllerVM provider;
  int moveBTNIndex;
  String imgPath;
  AlignmentGeometry align;
  MoveBTN(
      {required this.align,
      required this.imgPath,
      required this.moveBTNIndex,
      required this.provider,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: DragTarget(
        //when enter display triangle
        onMove: (details) {
          provider.changeResult(moveBTNIndex);
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

class Controller extends StatelessWidget {
  PlayControllerVM provider;
  Controller(this.provider, {super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return CircleAvatar(
      radius: 300, //screenWidth * .15,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(screenHeight * .01),
        height: 250, // screenHeight * .4,
        width: 250, //screenHeight * .4,
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
                      //triangle
                      MoveBTN(
                        provider: provider,
                        moveBTNIndex: 1,
                        imgPath: "lib/images/triangle.png",
                        align: Alignment.topCenter,
                      ),
                      //x
                      MoveBTN(
                        provider: provider,
                        moveBTNIndex: 3,
                        imgPath: "lib/images/x.png",
                        align: Alignment.bottomCenter,
                      ),
                      //circle
                      MoveBTN(
                        provider: provider,
                        moveBTNIndex: 0,
                        imgPath: "lib/images/circle.png",
                        align: Alignment.centerLeft,
                      ),
                      //square
                      MoveBTN(
                        provider: provider,
                        moveBTNIndex: 2,
                        imgPath: "lib/images/square.png",
                        align: Alignment.centerRight,
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
                data: "",
                rootOverlay: true,
                //ال ويدجت الاساسية هتتبدل بدة لما يتسحب
                childWhenDragging: const SizedBox(),
                feedback: const ControllerBTN(),
                child: const ControllerBTN()),
          ],
        ),
      ),
    ) //x
        ;
  }
}

class ControllerBTN extends StatelessWidget {
  const ControllerBTN({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return
        //shadow effect
        Container(
      height: 50, // screenHeight * .09,
      width: 50 //screenWidth * .035,
      ,
      decoration: BoxDecoration(boxShadow: [
        const BoxShadow(
            offset: Offset(3, 3), color: Colors.black, blurRadius: 5),
        const BoxShadow(
            offset: Offset(-3, -3), color: Colors.black, blurRadius: 5),
        BoxShadow(offset: const Offset(1, 1), color: greyColor),
      ], shape: BoxShape.circle, color: const Color.fromARGB(255, 82, 82, 82)),
      //gradient effect
      child: Container(
        height: 35, // screenHeight * .05,
        width: 35, //screenWidth * .02,
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
}
