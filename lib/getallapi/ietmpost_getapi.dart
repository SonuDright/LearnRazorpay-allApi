import 'dart:convert';

import 'package:flutter/material.dart';

import '../allmodels/Itempost_getmodel.dart';
import 'package:http/http.dart'as http;

import '../allmodels/item_get_model.dart';

class HomePostgetApi extends StatefulWidget {
  const HomePostgetApi({super.key});

  @override
  State<HomePostgetApi> createState() => _HomePostgetApiState();
}

class _HomePostgetApiState extends State<HomePostgetApi> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';

  Future<PostGetyMode?> itemPostGetData()async{
    var url = Uri.parse("https://api.razorpay.com/v1/items");
    var response = await http.get(url,headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},);
    if(response.statusCode==200){
      var usedPost = jsonDecode(response.body);
      var user = PostGetyMode.fromJson(usedPost);
      return user;

    }
    else
    {
      return PostGetyMode();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(future: itemPostGetData(), builder: (context, snapshot) {
          if(snapshot.hasData){
            var  item = snapshot.data?.items;
            var k = snapshot.data;
            return ListView.builder(
              itemCount: item?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text("${k?.entity}"),
                    Text("${k?.count}"),
                    Text("${item?[index].id}"),
                    Text("${item?[index].active}"),
                    Text("${item?[index].name}"),
                    Text("${item?[index].description}"),
                    Text("${item?[index].amount}"),
                    Text("${item?[index].unitAmount}"),
                    Text("${item?[index].currency}"),
                    Text("${item?[index].type}"),
                    Text("${item?[index].unit}"),
                    Text("${item?[index].taxInclusive}"),
                    Text("${item?[index].hsnCode}"),
                    Text("${item?[index].sacCode}"),
                    Text("${item?[index].taxRate}"),
                    Text("${item?[index].taxId}"),
                    Text("${item?[index].taxGroupId}"),
                  ],
                );

            },);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },),
      ),

    );
  }
}
