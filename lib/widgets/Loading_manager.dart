import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingManager extends StatelessWidget {
  const LoadingManager({ Key? key, required this.isLoading, required this.child }) : super(key: key);
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isLoading?Container(color: Colors.black45,): const SizedBox.shrink(),
        isLoading?Center(child: Center(
          child: SizedBox(
            width: 250,
            height: 250,
            child: Image.asset("assets/images/logo-test.png", scale: 1,),
          ),
        ),) : Container(),
        isLoading?const Center(child: Center(
          child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white,),
        ),) : Container()
      ],
    );
  }
}