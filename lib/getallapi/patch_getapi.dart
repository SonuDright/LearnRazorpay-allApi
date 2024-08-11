import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../allmodels/Itempost_getmodel.dart';
import '../allmodels/patch_model.dart';

class HomePatchGetApi extends StatefulWidget {
  const HomePatchGetApi({super.key});

  @override
  State<HomePatchGetApi> createState() => _HomePatchGetApiState();
}

class _HomePatchGetApiState extends State<HomePatchGetApi> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';
  Future<PatchGetyMode?> getPatchItem()async{
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
      body: SafeArea(child: FutureBuilder(future: getPatchItem(), builder: (context, snapshot) {
        if(snapshot.hasData){
          var iten = snapshot.data;
          return Column(children: [
            Center(child: Text("${iten?.id}")),
            Center(child: Text("${iten?.active}")),
            Center(child: Text("${iten?.name}")),
            Center(child: Text("${iten?.description}")),
            Center(child: Text("${iten?.amount}")),
            Center(child: Text("${iten?.unitAmount}")),
            Center(child: Text("${iten?.currency}")),
            Center(child: Text("${iten?.type}")),
            Center(child: Text("${iten?.unit}")),
            Center(child: Text("${iten?.taxInclusive}")),
            Center(child: Text("${iten?.hsnCode}")),
            Center(child: Text("${iten?.sacCode}")),
            Center(child: Text("${iten?.taxRate}")),
            Center(child: Text("${iten?.taxId}")),
            Center(child: Text("${iten?.taxGroupId}")),
            Center(child: Text("${iten?.createdAt}")),
          ],);
        }
        else{
       return   Center(child: CircularProgressIndicator(),);}
      },),),

    );
  }
}
