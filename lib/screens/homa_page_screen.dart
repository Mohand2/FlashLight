import 'package:flutter/material.dart';

import 'package:flashlight/flashlight.dart';
import 'package:soft_ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasFlashlight = false;
  bool _flashOn = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    //print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              //   border: _flashOn
              //       ? Border.all(color: Colors.yellow[50], width: 5)
              //       : null,
              //   borderRadius:
              //       BorderRadius.circular(MediaQuery.of(context).size.height),
              ),
          child: Center(
            child: _hasFlashlight
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_flashOn) {
                          Flashlight.lightOff();
                          _flashOn = false;
                          //_scaffColor = Colors.grey[850];
                        } else {
                          Flashlight.lightOn();
                          _flashOn = true;
                          //_scaffColor = Colors.grey[300];
                        }
                      });
                    },
                    child: _flashOn
                        ? Button(
                            iconPath: 'assets/images/lightOnV3.png',
                            flashOn: _flashOn,
                          )
                        : Button(
                            iconPath: 'assets/images/lightOffV3.png',
                            flashOn: _flashOn,
                          ),
                  )
                : Text(
                    'You phone has no flashLight.',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0),
                  ),
          ),
        ),
      ),
    );
  }
}
