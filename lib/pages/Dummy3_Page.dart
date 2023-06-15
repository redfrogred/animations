// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Dummy3_Page extends StatelessWidget {
  const Dummy3_Page({super.key});

  // (this page) variables
  static const String _fileName = 'Dummy3_Page.dart';  

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
            title: const Text( 'Dummy3' ),
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
                child: const Text( 'CLEMENTINE', style: TextStyle( fontSize: 32, fontWeight: FontWeight.bold)).animate()
                    .fadeIn(duration: 500.ms)
                    .slideX(begin: -1, curve: Curves.easeOutBack). 
                    then()
                    .shimmer(delay:400.ms, duration: 1800.ms)
                    .then()
                    .fadeOut(delay: 10000.ms),
              ),
                Animate(
                child: const Text( 'T E A C H E S', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange )).animate()
                    .fadeIn(delay: 500.ms, duration: 200.ms)
                    .slideY(begin: 2, curve: Curves.easeOut). 
                    then()
                    .shimmer(delay:400.ms, duration: 1800.ms)
                    .then()
                    .fadeOut(delay: 10300.ms, duration: 500.ms),
              ),  
                Animate(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: const Text( 'The Times Tables', style: TextStyle( fontSize: 16 )).animate()
                      .fadeIn(delay: 1100.ms, duration: 200.ms)
                      .then()
                      .fadeOut(delay: 12400.ms, duration: 500.ms),
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