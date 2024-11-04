import 'package:flutter/material.dart';
import 'package:tintok/Pages/DSS.dart';

//Page d'accueil principal
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.height;

    final DraggableScrollableController dsscontroler =
        DraggableScrollableController();

    return Stack(
      children: [
        GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy <= -10) {
              //Scroll vers le haut
              print("Afficher les commenaires");
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
        ),
        DSS(dsscontroller: dsscontroler),
      ],
    );
  }
}
