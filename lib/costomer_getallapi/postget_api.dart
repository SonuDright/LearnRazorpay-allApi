import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../allmodels/costomer_postmodel.dart';

class HomePostCostomerGetApi extends StatefulWidget {
  const HomePostCostomerGetApi({super.key});

  @override
  State<HomePostCostomerGetApi> createState() => _HomePostCostomerGetApiState();
}

class _HomePostCostomerGetApiState extends State<HomePostCostomerGetApi> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';
  
  Future<CostomerGetIdeModel?> postGetData()async{
    
    var url = Uri.parse("https://api.razorpay.com/v1/customers");
    var response = await http.get(url,headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},);
    if(response.statusCode==200){
      var used = jsonDecode(response.body);
      var user = CostomerGetIdeModel.fromJson(used);
      return user;
    }
    else{
      return CostomerGetIdeModel();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FutureBuilder(future: postGetData(), builder: (context, snapshot) {
        if(snapshot.hasData){
          var iterm = snapshot.data?.items;
          var kd = snapshot.data;
          return ListView.builder(
            itemCount: iterm?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text("${kd?.entity}"),
                  Text("${kd?.count}"),
                  Center(child: Text("${iterm?[index].id}")),
                  Center(child: Text("${iterm?[index].entity}")),
                  Center(child: Text("${iterm?[index].name}")),
                  Center(child: Text("${iterm?[index].email}")),
                  Center(child: Text("${iterm?[index].contact}")),
                  Center(child: Text("${iterm?[index].gstin}")),
                  Center(child: Text("${iterm?[index].notes}")),
                  Center(child: Text("${iterm?[index].shippingAddress}")),
                  Center(child: Text("${iterm?[index].createdAt}")),
                ],
              );

          },);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }

      },),),
      
    );
  }
}
