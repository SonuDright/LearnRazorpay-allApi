import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../allmodels/Itempost_getmodel.dart';
import '../allmodels/patch_model.dart';

class HomeDeletGetApi extends StatefulWidget {
  const HomeDeletGetApi({super.key});

  @override
  State<HomeDeletGetApi> createState() => _HomeDeletGetApiState();
}

class _HomeDeletGetApiState extends State<HomeDeletGetApi> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';
  Future<PatchGetyMode?> getDeletItem()async{
    var url = Uri.parse("https://api.razorpay.com/v1/items/item_OixnfQGOAsyHx6");
    var response = await http.get(url,headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},);
    if(response.statusCode==200){
      var useto = jsonDecode(response.body);
      var user = PatchGetyMode.fromJson(useto);
      return user;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FutureBuilder(future: getDeletItem(), builder: (context, snapshot) {
        if(snapshot.hasData){
          var sdk = snapshot.data;
          return Column(children: [
            Center(child: Text("${sdk?.id}")),
            Center(child: Text("${sdk?.active}")),
            Center(child: Text("${sdk?.name}")),
            Center(child: Text("${sdk?.description}")),
            Center(child: Text("${sdk?.amount}")),
            Center(child: Text("${sdk?.unitAmount}")),
            Center(child: Text("${sdk?.currency}")),
            Center(child: Text("${sdk?.type}")),
            Center(child: Text("${sdk?.unit}")),
            Center(child: Text("${sdk?.taxInclusive}")),
            Center(child: Text("${sdk?.hsnCode}")),
            Center(child: Text("${sdk?.sacCode}")),
            Center(child: Text("${sdk?.taxRate}")),
            Center(child: Text("${sdk?.taxId}")),
            Center(child: Text("${sdk?.taxGroupId}")),
            Center(child: Text("${sdk?.createdAt}")),
          ],);
        }
        else{
          return   Center(child: CircularProgressIndicator(),);}
      },),),

    );
  }
}
