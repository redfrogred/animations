// ignore_for_file: camel_case_types


//  see:
//  https://github.com/redfrogred/luckycat3/blob/main/lib/pages/GamePage.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Dummy6_Page extends StatefulWidget {
  Dummy6_Page({super.key});

  @override
  State<Dummy6_Page> createState() => _Dummy6_PageState();
}

class _Dummy6_PageState extends State<Dummy6_Page> with TickerProviderStateMixin {
  

  // (this page) variables
  static const String _fileName = 'Dummy6_Page.dart';  
  
  // animation stuff
  late AnimationController  _cloudset1Controller;         //  controller
  final  double             _cloudWidthInPixels = 800;    //  all cloudsets are this many piexels wide
  double                    _cloudset1Position = 800;     //  the current x position of cloudset
  final int                 _cloudset1Duration = 999;    //  lower = faster animation
  
@override
void initState() {
  super.initState();
  // start of setup for "CLOUDSET #1"
  _cloudset1Controller = AnimationController(
    duration: Duration( milliseconds: _cloudset1Duration ), // 
    vsync: this, // the ticker
  );

  //  start it in motion, and make it repeat
  _cloudset1Controller.forward();   //  starts it
  _cloudset1Controller.repeat();    //  repeats 

  //  add a listener in order to update x position
  _cloudset1Controller.addListener(() { 
    _cloudset1Position = 0 - ( _cloudWidthInPixels * _cloudset1Controller.value );
  });

  //  add a status listener
  //  (if it wasn't repeated, this would indicate 
  //   AnimationStatus.completed after when the duration 
  //   was reached...)
  _cloudset1Controller.addStatusListener((status) {
    Utils.log( _fileName, status.toString() );
  });

}

  @override
  void dispose() {
    Utils.log( _fileName, ' dispose()');
    _cloudset1Controller.dispose();
    super.dispose();
  }


  //  stopStartAnimation is used to pause (or restart)
  //  the animation when the user leaves/re-enters the
  //  page. (To avoid unnecessary animation.)
  stopStartAnimation () {
    Utils.log( _fileName,'stopStartAnimation()');
    _cloudset1Controller.isAnimating
        ? _cloudset1Controller.stop()
        : _cloudset1Controller.forward();  
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // is back button allowed?        
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,  
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: const Text( 'Dummy6' ),
            centerTitle: true,
          ), 
          body: Stack(
            children: [ 





              //  ===================================
              //  CLOUDSET #1
              //  ===================================
              AnimatedBuilder(
                animation: _cloudset1Controller,
                builder: (BuildContext context, _) {
                  return Positioned(
                    left: _cloudset1Position,
                    top: 0,
                    child: Opacity( opacity: 1, child: Image.asset('assets/images/clouds_9.png',)),
                  );
                },
              ),  

              //  ===================================
              //  Some other Container()
              //  ===================================
              Container(
                width: double.infinity,
                color: Colors.transparent,
                child: const Center(
                  child: Text('Dummy6_Page'),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}