import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../allmodels/Itempost_getmodel.dart';
import '../costomer_model/costomerget_model.dart';

class HomeCostomerGetApi extends StatefulWidget {
  const HomeCostomerGetApi({super.key});

  @override
  State<HomeCostomerGetApi> createState() => _HomeCostomerGetApiState();
}

class _HomeCostomerGetApiState extends State<HomeCostomerGetApi> {

  String apiKey = 'rzp_test_ZA3AuZYb7bEHag';
  String apiSecret = 'N830jGuk1vLCqb85len2Ef7F';
  Future<CostomerGetModel?> getItem()async{
    var url = Uri.parse("https://api.razorpay.com/v1/customers");
    var response = await http.get(url,headers: {'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}'},);
    if(response.statusCode==200){
      var useto = jsonDecode(response.body);
      var user = CostomerGetModel.fromJson(useto);
      return user;
    }
    else{
      return CostomerGetModel();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FutureBuilder(future: getItem(), builder: (context, snapshot) {
        if(snapshot.hasData){
          var item = snapshot.data?.items;
          var sdt = snapshot.data;
          return ListView.builder(
            itemCount: item?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text("${sdt?.entity}"),
                  Text("${sdt?.count}"),
                  Text("${item?[index].id}"),
                  Text("${item?[index].entity}"),
                  Text("${item?[index].name}"),
                  Text("${item?[index].email}"),
                  Text("${item?[index].contact}"),
                  Text("${item?[index].gstin}"),
                  Text("${item?[index].notes}"),
                  Text("${item?[index].shippingAddress}"),
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
