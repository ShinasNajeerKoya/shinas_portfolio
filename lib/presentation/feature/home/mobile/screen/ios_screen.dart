import 'package:flutter/material.dart';

class IosScreen extends StatelessWidget {
  const IosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('ios Screen'),
      ),
    );
  }
}
