// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Dummy2_Page extends StatefulWidget {
  const Dummy2_Page({super.key});

  @override
  State<Dummy2_Page> createState() => _Dummy2_PageState();
}

class _Dummy2_PageState extends State<Dummy2_Page> {


  // (this page) variables
  static const String _fileName = 'Dummy2_Page.dart';  
  static bool _visible = false; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    // fade in widget after 5 sec
    Timer(const Duration(seconds: 5), () {    
      _toggleViz();
    });
  }

  void _toggleViz() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _addPostFrameCallbackTriggered( context ) {
    Utils.log( _fileName, ' _addPostFrameCallbackTriggered()');
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
          backgroundColor: Config.mainBackgroundColor,
          appBar: AppBar(
            title: const Text( 'Dummy2' ),
            centerTitle: true,
          ), 
          body: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  width: 300,
                  child: const Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('This page name will fade in after 5 seconds. It used the AnimatedOpacity() widget.'),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 333),
                  child: Text( _fileName, style: TextStyle( fontSize: 32, color: Colors.yellow, fontWeight: FontWeight.bold )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    child: Text('Fade Toggle'),
                    onPressed: () {
                      // Call setState. This tells Flutter to rebuild the
                      // UI with the changes.
                      _toggleViz();
                    },
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