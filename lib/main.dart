import 'package:flutter/material.dart';

import 'costomer_getallapi/costomer_get_item.dart';
import 'costomer_getallapi/costomer_getid.dart';
import 'costomer_getallapi/costomer_putgetapi.dart';
import 'costomer_getallapi/postget_api.dart';
import 'getallapi/delete_getdata.dart';
import 'getallapi/getpost_itemapi.dart';
import 'getallapi/ietmpost_getapi.dart';
import 'getallapi/item_get_api.dart';
import 'getallapi/onlyitemget_api.dart';
import 'getallapi/patch_getapi.dart';
import 'getallapi/post_getapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeCostomerPutGet(),
    );
  }
}

