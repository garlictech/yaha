import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
              //leading: YahaBackButton(),
              title: const Text(
            'Walking',
          )),
          body: const Align(
              alignment: Alignment.center,
              child: Text("Live activities will happen here. Coming soon!"))),
    );
  }
}
