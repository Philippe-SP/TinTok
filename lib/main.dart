import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "Pages/home.dart";

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
          title: const Text("TinTok", style: TextStyle(color: Colors.black, fontSize: 42, fontFamily: "josefin-sans")),
          backgroundColor: const Color.fromARGB(255, 191, 191, 191),
        ),
        //Menu burger
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              //En-tete du menu burger
              DrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(182, 61, 61, 61)),
                child: Text("Drawer Header", style: TextStyle(color: Colors.white, fontSize: 38, fontFamily: "josefin-sans"))
              ),
              //Page home
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.home, color: CupertinoColors.black),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text("Home", style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
                  ]
                )
              ),
              //Page N°2
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.calendar_month, color: CupertinoColors.black),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text("Page 2", style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
                  ]
                )
              ),
              //Page N°3
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
            //Detection des mouvements tactiles
            child: const HomeScreen(),
          ),
        ),
        //Footer de l'application
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm, color: Colors.black, size: 35),
              label: 'Alarm'),
          BottomNavigationBarItem(
              icon: Icon(Icons.backpack, color: Colors.black, size: 35),
              label: 'BackPack'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label, color: Colors.black, size: 35),
              label: 'label'),
        ],
        backgroundColor: const Color.fromARGB(255, 191, 191, 191),),
      ),
    );
  }
}



