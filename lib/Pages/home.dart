//Page d'accueil principal
import 'package:flutter/material.dart';
import 'package:tintok/Pages/DSS.dart';
import 'package:tintok/Pages/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Page courante
    String currentPage = "home";

    final DraggableScrollableController dsscontroler =
        DraggableScrollableController();

    return SafeArea(
      //Image de fond
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy <= -10) {
            //Scroll vers le haut
            print("Afficher les commentaires");
            dsscontroler.animateTo(
              0.5,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          } else if (details.delta.dy >= 10) {
            //Scroll vers le bas
            dsscontroler.animateTo(
              0.5,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            print("Afficher le profil");
          }
        },
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx <= -10) {
            //Scroll vers la gauche
            print("Dislike");
          } else if (details.delta.dx >= 10) {
            //Scroll vers la droite
            print("Like");
          }
        },
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          //Detection des mouvements tactiles
          child: DSS(dssController: dsscontroler),
        ),
      ),
    );
  }
}
