import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "package:tintok/Pages/home.dart";

import "logs/database_logs.dart";

Future<void> main() async {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: dbURL,
    anonKey: dbKey,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Enlever la baniere debug en haut a droite
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //AppBar
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TinTok",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 42,
                  fontFamily: "josefin-sans")),
          backgroundColor: const Color.fromARGB(255, 191, 191, 191),
        ),
        //Menu burger
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            //En-tete du menu burger
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(182, 61, 61, 61)),
                child: Text("Drawer Header",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontFamily: "josefin-sans"))),
            //Page home
            ListTile(
                title: Row(children: [
              Icon(Icons.home, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Home",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
            //Page N°2
            ListTile(
                title: Row(children: [
              Icon(Icons.calendar_month, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Page 2",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
            //Page N°3
            ListTile(
                title: Row(children: [
              Icon(Icons.list, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Page 3",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
          ],
        )),
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
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black, size: 35),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment, color: Colors.black, size: 35),
                label: 'Comments'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black, size: 35),
              label: 'Profile',
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 191, 191, 191),
        ),
      ),
    );
  }
}
