import 'package:flutter/material.dart';
import 'package:proyecto_infantil/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/Fondo_Principal.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Menu de Principal"),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        endDrawer: SideMenu(scaffoldKey: scaffoldKey),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/img/logo_tecnm.png",
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Técnologico Nacional de México",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF326FD8),
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Text(
              "Instituto Técnologico de Tuxtepec",
              style: TextStyle(
                fontSize: 33,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 11, 64, 107),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            Image.asset("assets/img/ittux_logo.png", fit: BoxFit.cover),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: Text("Opciones", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 11, 64, 107),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/img/logo_ittux.png",
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
