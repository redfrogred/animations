// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Dummy1_Page extends StatelessWidget {
  const Dummy1_Page({super.key});

  // (this page) variables
  static const String _fileName = 'Dummy1_Page.dart';  

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
            title: const Text( 'Dummy1' ),
            centerTitle: true,
          ), 
          body: Container(
            color: Colors.transparent,
            child: const Center(
              child: Text( _fileName ),  
            ),
          ),
        ),
      ),
    );
  }
}