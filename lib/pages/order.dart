
import 'package:flutter/material.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<String> orders = [];

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      orders = prefs.getStringList('orders') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 198, 242),
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Order Page", style: AppWidgets.headLineTextStyle(28)),
            const SizedBox(height: 30),

            // 🔹 NOW VERTICAL LIST (CORRECT)
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {

                  // format → product,quantity,price
                  final data = orders[index].split(',');

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 184, 182, 218),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    
                          // IMAGE (UNCHANGED)
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffbab3a6),
                                  Color(0xffddd7cd),
                                  Color(0xffe59c8f),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(
                              "images/medicine_image.png",
                              height: 130,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                    
                          const SizedBox(width: 20),
                    
                          // DETAILS
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data[0],
                                    style: AppWidgets.headLineTextStyle(18)),
                                const SizedBox(height: 4),
                                Text("Quantity : ${data[1]}",
                                    style: AppWidgets.headLineTextStyle(18)),
                                const SizedBox(height: 4),
                                Text("Pharmacy App",
                                    style: AppWidgets.headLineTextStyle(18)),
                                const SizedBox(height: 4),
                                Text("Total Price : ₹ ${data[2]}",
                                    style: AppWidgets.headLineTextStyle(18)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
