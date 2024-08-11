import 'dart:convert';

import 'package:flutter/material.dart';

import '../costomer_model/costomerget_idmodel.dart';
import 'package:http/http.dart'as http;

class HomeCostomerGetId extends StatefulWidget {
  const HomeCostomerGetId({super.key});

  @override
  State<HomeCostomerGetId> createState() => _HomeCostomerGetIdState();
}

class _HomeCostomerGetIdState extends State<HomeCostomerGetId> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';
  Future<CostomerGetIdeModel?> getId()async{
    var url = Uri.parse("https://api.razorpay.com/v1/customers/cust_O6IK5oNHxUv7P9");
    var response = await http.get(url,headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},);
    if(response.statusCode==200){
      var uder = jsonDecode(response.body);
      var user = CostomerGetIdeModel.fromJson(uder);
      return user;
    }
    else{
      return CostomerGetIdeModel();
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(future: getId(), builder: (context, snapshot) {
          if(snapshot.hasData){
            var itom = snapshot.data;
            return Column(
              children: [
                Center(child: Text("${itom?.id}")),
                Center(child: Text("${itom?.entity}")),
                Center(child: Text("${itom?.name}")),
                Center(child: Text("${itom?.email}")),
                Center(child: Text("${itom?.contact}")),
                Center(child: Text("${itom?.gstin}")),
                Center(child: Text("${itom?.notes}")),
                Center(child: Text("${itom?.shippingAddress}")),
                Center(child: Text("${itom?.createdAt}")),

              ],
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },),
      ),
    );
  }
}
