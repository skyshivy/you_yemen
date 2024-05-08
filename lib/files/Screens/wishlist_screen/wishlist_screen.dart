import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child: Text(
      'WishList Screen',
      style:TextStyle(fontSize: 30)
      ),),);
  }
}