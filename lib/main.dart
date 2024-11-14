import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "package:tintok/Pages/SignUp.dart";
import "package:tintok/Pages/home.dart";
import "package:tintok/Pages/login.dart";

import "logs/database_logs.dart";

//Initialisation de la base de données
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: dbURL,
    anonKey: dbKey,
  );

  runApp(MainApp(
    userData: {},
  ));
}

class MainApp extends StatefulWidget {
  MainApp({super.key, required this.userData});

  final Map<String, dynamic> userData;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //Index du contenu de home
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
          children: [
            //En-tete du menu burger
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[900]),
                child: const Text("Drawer Header",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontFamily: "josefin-sans"))),
            //Page home
            const ListTile(
                title: Row(children: [
              Icon(Icons.home, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Home",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
            //Page N°2
            const ListTile(
                title: Row(children: [
              Icon(Icons.calendar_month, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Page 2",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
            //Page N°3
            const ListTile(
                title: Row(children: [
              Icon(Icons.list, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Page 3",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
          ],
        )),
        //Contenu principal de l'application
        body: [
          HomeScreen(
            userData: widget.userData,
          ),
          const LoginPage(),
          const SignUpPage(),
        ][_currentIndex],
        //Footer de l'application
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 20,
          unselectedFontSize: 18,
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          selectedItemColor: Colors.blue[900],
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 35), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.login, size: 35),
              label: 'Login',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box, size: 35),
              label: 'SignUp',
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 191, 191, 191),
        ),
      ),
    );
  }
}
