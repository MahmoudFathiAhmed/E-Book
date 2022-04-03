import 'package:flutter/material.dart';

class LicenceScreen extends StatelessWidget {
  const LicenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Licence'),
        centerTitle: true,
      ),
      body:  Center(
        child: Text('bla bla', style: Theme.of(context).textTheme.subtitle1,),
      ),
    );
  }
}
