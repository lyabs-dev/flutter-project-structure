import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../languages/localizations.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.instanceLocalization['app_title'])
      ),
      body: Container(

      ),
    );
  }

}