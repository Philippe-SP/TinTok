import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  //Controlleur du draggableScrollableSheet --> liste des commentaires
  final _draggableScrollableController = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Enlever la baniere debug en haut a droite
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //AppBar
        appBar: AppBar(
          centerTitle: true, 
          title: const Text("TinTok", style: TextStyle(color: Colors.white, fontSize: 42, fontFamily: "josefin-sans")), 
          backgroundColor: const Color.fromARGB(190, 110, 0, 0),
        ),
        //Menu burger
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 110, 0, 0)),
                child: Text("Drawer Header", style: TextStyle(color: Colors.white, fontSize: 38, fontFamily: "josefin-sans"))
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.home, color: CupertinoColors.black),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text("Home", style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
                  ]
                )
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.calendar_month, color: CupertinoColors.black),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text("Page 2", style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
                  ]
                )
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.list, color: CupertinoColors.black),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text("Page 3", style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
                  ]
                )
              ),
            ],
          )
        ),
        //Contenu principal de l'application
        body: SafeArea(
          //Image de fond
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                if(details.delta.dy < 0) {
                  setState(() {
                    _draggableScrollableController.jumpTo(0.2);
                    print("move");
                  });
                }
              },
              child: Center(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.0,
                  minChildSize: 0.0,
                  maxChildSize: 0.8,
                  snap: true,
                  controller: _draggableScrollableController,
                  builder: (
                    BuildContext context, 
                    ScrollController scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Center(
                          child: Container(
                            //decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                            width: double.maxFinite, 
                            height: 600,
                            color: const Color.fromARGB(182, 61, 61, 61),
                            padding: const EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: const <Widget>[
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Icon(Icons.comment, color: Color.fromARGB(255, 191, 191, 191), size: 50),
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Text("Commentaire 1", style: TextStyle(color: Colors.white, fontSize: 42, fontFamily: "josefin-sans"))
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Icon(Icons.comment, color: Color.fromARGB(255, 191, 191, 191), size: 50),
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Text("Commentaire 2",  style: TextStyle(color: Colors.white, fontSize: 42, fontFamily: "josefin-sans"))
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Icon(Icons.comment, color: Color.fromARGB(255, 191, 191, 191), size: 50),
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Text("Commentaire 3",  style: TextStyle(color: Colors.white, fontSize: 42, fontFamily: "josefin-sans"))
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Icon(Icons.comment, color: Color.fromARGB(255, 191, 191, 191), size: 50),
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Text("Commentaire 4",  style: TextStyle(color: Colors.white, fontSize: 42, fontFamily: "josefin-sans"))
                                          ],
                                        ),
                                      ),
                                    ]
                                  ),
                                )
                              ]
                            ),
                          )
                        ),
                      );
                    },
                ),
              )
            ),
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          color: Color.fromARGB(190, 110, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.alarm, color: Colors.white, size: 35),
              Icon(Icons.backpack, color: Colors.white, size: 35),
              Icon(Icons.label, color: Colors.white, size: 35),
            ]
          )
        ),
    ));
  }
}

// void switchBackgroung(index) {
//   switch(index) {
//     case 1:
//       background = "assets/images/background.jpg";
//       break;
//     case 2:
//       background = "assets/images/background_second.jpg";
//       break;
//     case 3:
//       background = "assets/images/background_third.jpg";
//       break;
//     case 4:
//       background = "assets/images/background_fourth.jpeg";
//       break;
//   }
// }