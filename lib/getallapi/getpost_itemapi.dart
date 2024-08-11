import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../allmodels/Itempost_getmodel.dart';

class HomePageGetPostApi extends StatefulWidget {
  const HomePageGetPostApi({super.key});

  @override
  State<HomePageGetPostApi> createState() => _HomePageGetPostApiState();
}

class _HomePageGetPostApiState extends State<HomePageGetPostApi> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';
  Future<PostGetyMode?> getPostItem()async{
    var url = Uri.parse("https://api.razorpay.com/v1/items");
    var response = await http.get(url,headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},);
    if(response.statusCode==200){
      var useto = jsonDecode(response.body);
      var user = PostGetyMode.fromJson(useto);
      return user;
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FutureBuilder(future: getPostItem(), builder: (context, snapshot) {
        if(snapshot.hasData){
         var item = snapshot.data?.items;
         var sd = snapshot.data;
         return ListView.builder(
           itemCount: item?.length,
           itemBuilder: (context, index) {
             return Column(
               children: [
                 Text("${sd?.entity}"),
                 Text("${sd?.count}"),
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
                 Text("${item?[index].createdAt}"),

               ],
             );

         },);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      },)),

    );
  }
}
