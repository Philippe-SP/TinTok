import 'package:flutter/material.dart';
import 'package:tintok/Pages/DSS.dart';
import 'package:tintok/Pages/profil.dart';
import 'package:tintok/services/customPageRoute.dart';
import 'package:video_player/video_player.dart';

//Page pricipale
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.userData});

  final Map<String, dynamic> userData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Lecteur de videos
  late VideoPlayerController? _controller;

  //Index de la video en cours
  int _selectedVideoIndex = 0;

  //Liste des videos
  List<String> videoPaths = [
    "assets/videos/frog_video.mp4",
    "assets/videos/tree_video.mp4",
    "assets/videos/frog_video.mp4",
  ];

  @override
  //Initialisation des variables crée juste avant
  void initState() {
    super.initState();
    _initializeVideo(videoPaths[_selectedVideoIndex]);
  }

  void _initializeVideo(String videoPath) {
    _controller = VideoPlayerController.asset(videoPath[_selectedVideoIndex])
      ..initialize().then((_) {
        setState(() {});
        //Lancement de la video en boucle
        _controller?.play();
        _controller?.setLooping(true);
      });
  }

  //Passer a la prochaine video
  void _playNextVideo() {
    if (_selectedVideoIndex < videoPaths.length - 1) {
      setState(() {
        _selectedVideoIndex++;
        _initializeVideo(videoPaths[_selectedVideoIndex]);
      });
    } else {
      print(
          "C'est la dernière vidéo"); // Optionnel : message pour la dernière vidéo
    }
  }

  //Passer a la video precedante
  void _playPreviousVideo() {
    if (_selectedVideoIndex > 0) {
      setState(() {
        _selectedVideoIndex--;
        _initializeVideo(videoPaths[_selectedVideoIndex]);
      });
    } else {
      print(
          "C'est la première vidéo"); // Optionnel : message pour la première vidéo
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Controlleur du DSS
    final DraggableScrollableController dssController =
        DraggableScrollableController();

    return Scaffold(
      body: SafeArea(
        //Gestion des mouvements de slide
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy <= -10) {
              print("Afficher les commentaires");
              dssController.animateTo(
                0.5,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            } else if (details.delta.dy >= 10) {
              Navigator.push(
                context,
                CustomPageRoute(
                  child: ProfilePage(
                    userData: widget.userData,
                  ),
                ),
              );
              print("Afficher le profil");
            }
          },
          onHorizontalDragUpdate: (details) {
            if (details.delta.dx <= -10) {
              // Glissement vers la gauche : revenir à la vidéo précédente
              _playPreviousVideo();
            } else if (details.delta.dx >= 10) {
              // Glissement vers la droite : aller à la vidéo suivante
              _playNextVideo();
            }
          },
          child: Column(
            children: [
              // Videos affichées
              Expanded(
                flex: 1,
                child: Center(
                    child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: VideoPlayer(
                    _controller!,
                  ),
                )),
              ),
              // DraggableScrollableSheet pour les commentaires
              DSS(dssController: dssController),
            ],
          ),
        ),
      ),
    );
  }
}
