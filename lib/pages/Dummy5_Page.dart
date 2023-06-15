// ignore_for_file: camel_case_types


//  see:
//  https://github.com/redfrogred/luckycat3/blob/main/lib/pages/GamePage.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Dummy5_Page extends StatefulWidget {
  Dummy5_Page({super.key});

  @override
  State<Dummy5_Page> createState() => _Dummy5_PageState();
}

class _Dummy5_PageState extends State<Dummy5_Page> with TickerProviderStateMixin {
  

  // (this page) variables
  static const String _fileName = 'Dummy5_Page.dart';  
  static const int    _titleDelay1 = 3000;     // delay initial animation by this much
  static const int    _titleDelay2 = 1000;    
  
  // animation controller
  late AnimationController _controller1;
  final double  _leftMax        = 800;
  double        _left1          = 800; 
  
@override
void initState() {
  super.initState();
  // setup CLOUDSET_1
  _controller1 = AnimationController(
    duration: Duration( milliseconds: 33000 ), // 
    vsync: this, 
  );

  _controller1.forward();
  _controller1.repeat();    

    _controller1.addListener(() {
    // Utils.log( _controller1.value.toString() );
    setState(() {
      _left1 = 0 - (_leftMax * _controller1.value);
    });
  });

  //stopStartAnimation ();

}

  @override
  void dispose() {
    Utils.log( _fileName, ' dispose()');
    _controller1.dispose();
    super.dispose();
  }


  stopStartAnimation () {
    // Utils.log('(method) GamePage().stopStartAnimation()');
    _controller1.isAnimating
        ? _controller1.stop()
        : _controller1.forward();  
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
            title: const Text( 'Dummy5' ),
            centerTitle: true,
          ), 
          body: Stack(
            children: [ 

            Positioned(
                left: _left1,
                top: 0,
                child: Opacity( opacity: 1, child: Image.asset('assets/images/clouds_9.png',)),
            ),              

              Container(
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
                        .slideX(begin: 1.5, curve: Curves.easeOutBack). 
                        then()
                        .shimmer(duration: 1800.ms)
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
            ],
          ),
        ),
      ),
    );
  }
}