import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../allmodels/post_model.dart';

class HomePostApi extends StatefulWidget {
  const HomePostApi({super.key});

  @override
  State<HomePostApi> createState() => _HomePostApiState();
}

class _HomePostApiState extends State<HomePostApi> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';

  Future<PostMode?> postApi()async{
  var url = Uri.parse("https://api.razorpay.com/v1/items");
  var response = await http.post(url,headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},
      body: {
        "id": "item_OiQUHKir7ecteI",
        "active": true,
        " First name": "Sonu Dright",
        "  Last name": "Rahul Sir",
        "description": "Yellow herb from Resident Evil",
        "amount": 50000,
        "unit_amount": 50000,
        "currency": "INR",
        "type": "invoice",
        "unit": null,
        "tax_inclusive": false,
        "hsn_code": null,
        "sac_code": null,
        "tax_rate": null,
        "tax_id": null,
        "tax_group_id": null,
        "created_at": 1723124723
      });
  if(response.statusCode==200){
    var usee = jsonDecode(response.body);
    var user = PostMode.fromJson(usee);
    print(user);
  }
  else{
    return PostMode();
  }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: () {
              postApi();
            }, child: Text("Post Data")),
          ),

        ],
      ),),

    );
  }
}
