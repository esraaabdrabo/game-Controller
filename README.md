
# Game Controller

Flutter project. 

To train on user interaction with the application.

The basic widgets are
# Draggable 

 
    Draggable(
      onDragStarted: () {},
      onDraggableCanceled: (velocity, offset) {},
      data: "",
      rootOverlay: true,
      childWhenDragging: const SizedBox(),
      feedback: const ControllerBTN(),
      child: const ControllerBTN()       
    ),
# DragTarget
     DragTarget(
        onMove: (details) {},
        onLeave: (data) {},
        builder: (context, acceptedData, rejectedData) {
          return child();
        },
      ),




# StateMangement
    provider
    



|        Mobile        |        Web        |        DeskTop        |
|     -------------    |   -------------   |    ---------------    |
|    ![Screenshot_20230115_222609](https://user-images.githubusercontent.com/91227030/212568785-c2ddfc63-7cf9-4a9e-9ecb-12dbf1b98c64.jpg) |   Content Cell    |     Content Cell      |
|    Content Cell      |   Content Cell    |     Content Cell      |
