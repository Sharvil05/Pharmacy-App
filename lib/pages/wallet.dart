// import 'package:flutter/material.dart';
// import 'package:pharmacyapp/widgets/support_widget.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {

//   late Razorpay _razorpay;

//   // ❌ Currently not used directly in UI input
//   // TextEditingController amountController = TextEditingController();

//   String selectedAmount = "100"; // ✅ used instead

//   @override
//   void initState() {
//     super.initState();

//     _razorpay = Razorpay();

//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     _razorpay.clear();
//     super.dispose();
//   }

//   // ---------------- PAYMENT HANDLERS ----------------

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Payment Successful"),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Payment Failed"),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("External Wallet Selected"),
//       ),
//     );
//   }

//   // ---------------- OPEN RAZORPAY ----------------

//   void openCheckout(String amount) {
//     var options = {
//       'key': 'rzp_test_xxxxxxxx', // 🔴 Test key (KYC ke bina bhi TEST MODE chalega)
//       'amount': int.parse(amount) * 100, // Razorpay works in paise
//       'name': 'Pharmacy App',
//       'description': 'Wallet Recharge',
//       'prefill': {
//         'contact': '9999999999',
//         'email': 'user@example.com',
//       },
//       'external': {
//         'wallets': ['paytm'],
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint("Razorpay Error: $e");
//     }
//   }

//   // ---------------- UI (UNCHANGED) ----------------

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 201, 198, 242),
//       body: Container(
//         margin: const EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Text("Wallet Page", style: AppWidgets.headLineTextStyle(28)),

//             const SizedBox(height: 20),
//             Container(
//               margin: const EdgeInsets.only(right: 20),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 184, 182, 218),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100, width: 100),
//                   const SizedBox(width: 30),
//                   Column(
//                     children: [
//                       Text("Your Wallet", style: AppWidgets.headLineTextStyle(20)),
//                       const SizedBox(height: 2),
//                       Text("\$200", style: AppWidgets.headLineTextStyle(30)),
//                     ],
//                   )
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   amountButton("\$100", "100"),
//                   amountButton("\$200", "200"),
//                   amountButton("\$500", "500"),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             Center(
//               child: GestureDetector(
//                 onTap: () {
//                   openCheckout(selectedAmount);
//                 },
//                 child: Container(
//                   width: 250,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xffbab3a6),
//                         Color(0xffddd7cd),
//                         Color.fromARGB(255, 163, 144, 140),
//                       ],
//                     ),
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Add Money", style: AppWidgets.headLineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 30),

//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(224, 223, 223, 240),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//                     Text("Your Transactions", style: AppWidgets.headLineTextStyle(22)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------- AMOUNT BUTTON ----------------

//   Widget amountButton(String text, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 20),
//       child: GestureDetector(
//         onTap: () {
//           selectedAmount = value; // ✅ used
//         },
//         child: Container(
//           width: 130,
//           height: 50,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(22),
//           ),
//           child: Center(
//             child: Text(text, style: AppWidgets.whiteTextStyle(20)),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:pharmacyapp/widgets/support_widget.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {

//   late Razorpay _razorpay;
//   TextEditingController amountController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     _razorpay = Razorpay();

//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     _razorpay.clear();
//     super.dispose();
//   }

//   // ---------------- PAYMENT HANDLERS ----------------

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
//     );
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Payment Failed: ${response.message}")),
//     );
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("External Wallet: ${response.walletName}")),
//     );
//   }

//   // ---------------- OPEN RAZORPAY ----------------

//   void openCheckout(String amount) async {
//     var options = {
//       'key': 'rzp_test_xxxxxxxx', // 🔴 REPLACE WITH YOUR RAZORPAY KEY
//       'amount': int.parse(amount) * 100, // paise
//       'name': 'Pharmacy App',
//       'description': 'Wallet Recharge',
//       'prefill': {
//         'contact': '9999999999',
//         'email': 'user@example.com',
//       },
//       'external': {
//         'wallets': ['paytm'],
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint("Error: $e");
//     }
//   }

//   // ---------------- UI (UNCHANGED) ----------------

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 201, 198, 242),
//       body: Container(
//         margin: const EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Text("Wallet Page", style: AppWidgets.headLineTextStyle(28)),

//             const SizedBox(height: 20),
//             Container(
//               margin: const EdgeInsets.only(right: 20),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 184, 182, 218),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100, width: 100),
//                   const SizedBox(width: 30),
//                   Column(
//                     children: [
//                       Text("Your Wallet", style: AppWidgets.headLineTextStyle(20)),
//                       const SizedBox(height: 2),
//                       Text("\$200", style: AppWidgets.headLineTextStyle(30)),
//                     ],
//                   )
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [

//                   amountButton("\$100", "100"),
//                   amountButton("\$200", "200"),
//                   amountButton("\$500", "500"),

//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             Center(
//               child: GestureDetector(
//                 onTap: () {
//                   openCheckout(amountController.text.isEmpty ? "100" : amountController.text);
//                 },
//                 child: Container(
//                   width: 250,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xffbab3a6),
//                         Color(0xffddd7cd),
//                         Color.fromARGB(255, 163, 144, 140),
//                       ],
//                     ),
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Add Money", style: AppWidgets.headLineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 30),

//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(224, 223, 223, 240),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//                     Text("Your Transactions", style: AppWidgets.headLineTextStyle(22)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------- AMOUNT BUTTON ----------------

//   Widget amountButton(String text, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 20),
//       child: GestureDetector(
//         onTap: () {
//           amountController.text = value;
//         },
//         child: Container(
//           width: 130,
//           height: 50,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(22),
//           ),
//           child: Center(
//             child: Text(text, style: AppWidgets.whiteTextStyle(20)),
//           ),
//         ),
//       ),
//     );
//   }
// }

                                         
// import 'package:flutter/material.dart';
// import 'package:pharmacyapp/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 201, 198, 242),


//       body: Container(
//         margin: EdgeInsets.only(top: 60,left: 20),

        
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Text("Wallet Page",style: AppWidgets.headLineTextStyle(28),),

//             SizedBox(height: 20,),
//             Container(
//               margin: EdgeInsets.only(right: 20),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(

//                 color: Color.fromARGB(255, 184, 182, 218),
//                 borderRadius: BorderRadius.circular(30)

//               ),
//               child: Row(
//                 children: [

//                   Image.asset("images/wallet.png",height: 100,width: 100,fit: BoxFit.cover,),
//                   SizedBox(width: 30,),
//                   Column(
//                     children: [
//                       Text("Your Wallet",style: AppWidgets.headLineTextStyle(20),),
//                       SizedBox(height: 2.0,),
//                       Text("\$200",style: AppWidgets.headLineTextStyle(30),)
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 20,),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Container(
//                 margin: EdgeInsets.only(right: 30),
//                 child: Row(
//                   children: [
                
//                     Container(
//                       width: 130,
//                       height: 50,
                
//                       decoration: BoxDecoration(
                
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(22)
//                       ),
//                       child: Center(child: Text("\$100",style: AppWidgets.whiteTextStyle(20),)),
//                     ),
                
//                     SizedBox(width: 20,),
//                     Container(
//                       width: 130,
//                       height: 50,
                
//                       decoration: BoxDecoration(
                
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(22)
//                       ),
//                       child: Center(child: Text("\$200",style: AppWidgets.whiteTextStyle(20),)),
//                     ),
                
//                     SizedBox(width: 20,),
//                     Container(
//                       width: 130,
//                       height: 50,
                
//                       decoration: BoxDecoration(
                
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(22)
//                       ),
//                       child: Center(child: Text("\$500",style: AppWidgets.whiteTextStyle(20),)),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 30,),
           
//             Center(
//               child: Container(
//                 width: 250,
//                 height: 50,
//                    decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Color(0xffbab3a6),
//                           Color(0xffddd7cd),
//                           Color.fromARGB(255, 163, 144, 140),
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(15),
              
//                 ),
//                 child: Center(child: Text("Add Money",style: AppWidgets.headLineTextStyle(22),)),
//               ),
//             ),

//             SizedBox(height: 30,),

//             Expanded(
//               child: Container(
//                 margin: EdgeInsets.only(right: 20),
              
//                 width: MediaQuery.of(context).size.width,
                
//                  decoration: BoxDecoration(
//                         color: Color.fromARGB(224, 223, 223, 240),
//                         //border: Border.all(color: Colors.white),
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                
//                   ),
//                   child: Column(
                    
//                     children: [
//                       SizedBox(height: 20,),
//                       Text("Your Transactions",style: AppWidgets.headLineTextStyle(22),),

//                       SizedBox(height: 20,),
                      
//                       Container(
//                         padding: EdgeInsets.only(left: 20,right: 20),
//                         margin: EdgeInsets.only(left: 20,right: 20),
//                         width: MediaQuery.of(context).size.width,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20)
//                         ),
//                         child: Row(
                          
//                           children: [
//                             Image.asset("images/cashback.png",height: 60,width: 60, fit: BoxFit.cover,),
//                             Spacer(),
//                             Text("\$500",style: AppWidgets.headLineTextStyle(26),),
//                             Spacer(),
//                             Container(
//                               height: 40,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 169, 230, 171),
//                                 borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: Center(child: Text("CREDIT",style: AppWidgets.headLineTextStyle(16),)),
//                             )

//                           ],
//                         ),
//                       ),

//                     SizedBox(height: 20,),
                      
//                       Container(
//                         padding: EdgeInsets.only(left: 20,right: 20),
//                         margin: EdgeInsets.only(left: 20,right: 20),
//                         width: MediaQuery.of(context).size.width,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20)
//                         ),
//                         child: Row(
                          
//                           children: [
//                             Image.asset("images/debite.png",height: 60,width: 60, fit: BoxFit.cover,),
//                             Spacer(),
//                             Text("\$500",style: AppWidgets.headLineTextStyle(26),),
//                             Spacer(),
//                             Container(
//                               height: 40,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 230, 171, 169),
//                                 borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: Center(child: Text("DEBIT",style: AppWidgets.headLineTextStyle(16),)),
//                             )

//                           ],
//                         ),
//                       )
//                     ],
//                   ),
               
//               ),
//             )


//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  int walletAmount = 200;

  List<Map<String, String>> transactions = [];

  @override
  void initState() {
    super.initState();
    loadWalletData();
  }

  // ---------------- LOAD DATA ----------------
  Future<void> loadWalletData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      walletAmount = prefs.getInt('walletAmount') ?? 200;

      List<String> txList = prefs.getStringList('transactions') ?? [];

      transactions = txList.map((e) {
        var parts = e.split(',');
        return {
          'type': parts[0],
          'amount': parts[1],
        };
      }).toList();
    });
  }

  // ---------------- SAVE DATA ----------------
  Future<void> saveWalletData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('walletAmount', walletAmount);

    List<String> txList =
        transactions.map((e) => "${e['type']},${e['amount']}").toList();

    prefs.setStringList('transactions', txList);
  }

  // ---------------- FAKE PAYMENT ----------------
  void fakeAddMoney(int amount) {
    setState(() {
      walletAmount += amount;

      transactions.insert(0, {
        'type': 'CREDIT',
        'amount': amount.toString(),
      });
    });

    saveWalletData();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("₹$amount added successfully (Fake Payment)")),
    );
  }

  // ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 198, 242),
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Wallet Page", style: AppWidgets.headLineTextStyle(28)),

            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 184, 182, 218),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Image.asset("images/wallet.png", height: 100, width: 100),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      Text("Your Wallet", style: AppWidgets.headLineTextStyle(20)),
                      const SizedBox(height: 2),
                      Text("₹$walletAmount",
                          style: AppWidgets.headLineTextStyle(30)),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [

                  amountButton("₹100", 100),
                  amountButton("₹200", 200),
                  amountButton("₹500", 500),

                ],
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffbab3a6),
                      Color(0xffddd7cd),
                      Color.fromARGB(255, 163, 144, 140),
                    ],
                  ),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text("Add Money",
                      style: AppWidgets.headLineTextStyle(22)),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(224, 223, 223, 240),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text("Your Transactions",
                        style: AppWidgets.headLineTextStyle(22)),

                    const SizedBox(height: 20),

                    Expanded(
                      child: ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final tx = transactions[index];

                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  tx['type'] == "CREDIT"
                                      ? "images/cashback.png"
                                      : "images/debite.png",
                                  height: 60,
                                  width: 60,
                                ),
                                const Spacer(),
                                Text("₹${tx['amount']}",
                                    style:
                                        AppWidgets.headLineTextStyle(26)),
                                const Spacer(),
                                Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: tx['type'] == "CREDIT"
                                        ? const Color.fromARGB(
                                            255, 169, 230, 171)
                                        : const Color.fromARGB(
                                            255, 230, 171, 169),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(tx['type']!,
                                        style:
                                            AppWidgets.headLineTextStyle(
                                                16)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- BUTTON ----------------
  Widget amountButton(String text, int value) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () => fakeAddMoney(value),
        child: Container(
          width: 130,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
            child: Text(text, style: AppWidgets.whiteTextStyle(20)),
          ),
        ),
      ),
    );
  }
}
