import 'dart:convert';

import 'package:flutter/material.dart';

import '../costomer_model/costomer_putmodel.dart';
import 'package:http/http.dart'as http;
class HomeCostomerPutGet extends StatefulWidget {
  const HomeCostomerPutGet({super.key});

  @override
  State<HomeCostomerPutGet> createState() => _HomeCostomerPutGetState();
}

class _HomeCostomerPutGetState extends State<HomeCostomerPutGet> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';
  
  Future<CostomerPutModel?> putGetData()async{
    
    var url = Uri.parse("https://api.razorpay.com/v1/customers/cust_OjBme8v3FBYRGT");
    var response = await http.get(url,headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},);
    if(response.statusCode==200){
      var useders = jsonDecode(response.body);
      var user = CostomerPutModel.fromJson(useders);
      return user;
    }
    return CostomerPutModel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FutureBuilder(future: putGetData(), builder: (context, snapshot) {
        if(snapshot.hasData){
          var iten = snapshot?.data;
          return Column(children: [
            Center(child: Text("${iten?.id}")),
            Center(child: Text("${iten?.entity}")),
            Center(child: Text("${iten?.name}")),
            Center(child: Text("${iten?.email}")),
            Center(child: Text("${iten?.contact}")),
            Center(child: Text("${iten?.gstin}")),
            Center(child: Text("${iten?.notes}")),
            Center(child: Text("${iten?.shippingAddress}")),
            Center(child: Text("${iten?.createdAt}")),
          ],);
        }
        return Center(child: CircularProgressIndicator(),);
      },),),
      
    );
  }
}
