// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
//
//
//
// class HomeRazorPay extends StatefulWidget {
//   const HomeRazorPay({Key? key}) : super(key: key);
//
//   @override
//   State<HomeRazorPay> createState() => _HomeRazorPayState();
// }
//
// class _HomeRazorPayState extends State<HomeRazorPay> {
//
//    String keyId = "rzp_test_Gp49m5v2dtN0Dt";
//    String keySecret = "Ex0qrtw14q7PaWPG7ES9xzMl";
//
//   final _razorpay = Razorpay();
//
//
//
//   @override
//   void initState() {
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//       _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//       _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     });
//     super.initState();
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     // Do something when payment succeeds
//     print(response);
//     verifySignature(
//       signature: response.signature,
//       paymentId: response.paymentId,
//       orderId: response.orderId,
//     );
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     print(response);
//     // Do something when payment fails
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(response.message ?? ''),
//       ),
//     );
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print(response);
//     // Do something when an external wallet is selected
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(response.walletName ?? ''),
//       ),
//     );
//   }
//
// // create order
//   void createOrder() async {
//     String username = keyId;
//     String password = keySecret;
//     String basicAuth =
//         'Basic ${base64Encode(utf8.encode('$username:$password'))}';
//
//     Map<String, dynamic> body = {
//       "amount": 100,
//       "currency": "INR",
//       "receipt": "rcptid_11"
//     };
//     var res =ttp.pos await ht(
//       Uri.https(
//           "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
//       headers: <String, String>{
//         "Content-Type": "application/json",
//         'authorization': basicAuth,
//       },
//       body: jsonEncode(body),
//     );
//
//     if (res.statusCode == 200) {
//       openGateway(jsonDecode(res.body)['id']);
//     }
//     print(res.body);
//   }
//
//   openGateway(String orderId) {
//     var options = {
//       'key': keyId,
//       'amount': 100, //in the smallest currency sub-unit.
//       'name': 'Sonu Dright.',
//       'order_id': orderId, // Generate order_id using Orders API
//       'description': 'Fine T-Shirt',
//       'timeout': 60 * 5, // in seconds // 5 minutes
//       'prefill': {
//         'contact': '9631585973',
//         'email': 'sonudright@gmail.com',
//       }
//     };
//     _razorpay.open(options);
//   }
//
//   verifySignature({
//     String? signature,
//     String? paymentId,
//     String? orderId,
//   }) async {
//     Map<String, dynamic> body = {
//       'razorpay_signature': signature,
//       'razorpay_payment_id': paymentId,
//       'razorpay_order_id': orderId,
//     };
//
//     var parts = [];
//     body.forEach((key, value) {
//       parts.add('${Uri.encodeQueryComponent(key)}='
//           '${Uri.encodeQueryComponent(value)}');
//     });
//     var formData = parts.join('&');
//     var res = await http.post(
//       Uri.https(
//         "10.0.2.2", // my ip address , localhost
//         "razorpay_signature_verify.php",
//       ),
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded", // urlencoded
//       },
//       body: formData,
//     );
//
//     print(res.body);
//     if (res.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(res.body),
//         ),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     _razorpay.clear(); // Removes all listeners
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Razorpay "),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 createOrder();
//               },
//               child: const Text("Pay Rs.1"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }