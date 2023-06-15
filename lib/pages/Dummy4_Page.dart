// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Dummy4_Page extends StatelessWidget {
  const Dummy4_Page({super.key});

  // (this page) variables
  static const String _fileName = 'Dummy4_Page.dart';  
  static const int    _titleDelay1 = 333;     // delay initial animation by this much
  static const int    _titleDelay2 = 1000;    // fade out the animation at this point

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
          backgroundColor: Config.mainBackgroundColor,
          appBar: AppBar(
            title: const Text( 'Dummy4' ),
            centerTitle: true,
          ), 
          body: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                Animate(
                child: Image.asset('assets/images/clementine_2.png',
                  width: 300,
                  // scale: 2.5,
                  // color: Color.fromARGB(255, 15, 147, 59),
                ).animate(
                  delay: _titleDelay1.ms,
                  onInit: (context) {
                    Utils.log('','title animation init!');
                  },
                  onPlay: (context) {
                    Utils.log('','title animation started!');
                  },
                  onComplete: (context) {
                    Utils.log('','title animation done!');
                  }
                )
                    .fadeIn(duration: 500.ms)
                    .slideX(begin: -1, curve: Curves.easeOutBack). 
                    then()
                    .shimmer(delay:400.ms, duration: 1800.ms)
                    .then()
                    .fadeOut(delay: _titleDelay2.ms),
              ),
                Animate(
                child: const Text( 'T E A C H E S', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange )).animate(
                  delay: _titleDelay1.ms,
                )
                    .fadeIn(delay: 500.ms, duration: 200.ms)
                    .slideY(begin: 2, curve: Curves.easeOut). 
                    then()
                    .shimmer(delay:400.ms, duration: 1800.ms)
                    .then()
                    .fadeOut(delay: (_titleDelay2+300).ms, duration: 500.ms),
              ),  
                Animate(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: const Text( 'The Times Tables', style: TextStyle( fontSize: 16 )).animate(
                  delay: _titleDelay1.ms,
                )
                    .fadeIn(delay: 1100.ms, duration: 200.ms)
                      .then()
                      .fadeOut(delay: (_titleDelay2+2300).ms, duration: 500.ms),
                ),
              ),                            
            ],
            ),
          ),
        ),
      ),
    );
  }
}