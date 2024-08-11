import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../allmodels/onlyget_model.dart';

class HomeOnlyGetItemApi extends StatefulWidget {
  const HomeOnlyGetItemApi({super.key});

  @override
  State<HomeOnlyGetItemApi> createState() => _HomeOnlyGetItemApiState();
}

class _HomeOnlyGetItemApiState extends State<HomeOnlyGetItemApi> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';
  
  Future<OnlygetGetMode?> onlyGetData()async{
    var url = Uri.parse("https://api.razorpay.com/v1/items/item_OhyGt7X7qFyzzw");
    var response = await http.get(url,
      headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},
    );
    if(response.statusCode==200){
      var used = jsonDecode(response.body);
      var user = OnlygetGetMode.fromJson(used);
      return user;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FutureBuilder(future: onlyGetData(), builder: (context, snapshot) {
        if(snapshot.hasData){
          var item = snapshot.data;
          return Column(children: [
            Center(child: Text("${item?.id}")),
            Center(child: Text("${item?.active}")),
            Center(child: Text("${item?.name}")),
            Center(child: Text("${item?.description}")),
            Center(child: Text("${item?.amount}")),
            Center(child: Text("${item?.unitAmount}")),
            Center(child: Text("${item?.currency}")),
            Center(child: Text("${item?.type}")),
            Center(child: Text("${item?.unit}")),
            Center(child: Text("${item?.taxInclusive}")),
            Center(child: Text("${item?.hsnCode}")),
            Center(child: Text("${item?.sacCode}")),
            Center(child: Text("${item?.taxRate}")),
            Center(child: Text("${item?.taxId}")),
            Center(child: Text("${item?.taxGroupId}")),
            Center(child: Text("${item?.createdAt}")),
          ],);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      },),),
    );
  }
}
