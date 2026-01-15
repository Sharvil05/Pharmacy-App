
import 'package:flutter/material.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'order.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String productname, detail, price;

  DetailPage({
    required this.productname,
    required this.detail,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  double totlaPrice = 0;

  @override
  void initState() {
    super.initState();
    totlaPrice = double.parse(widget.price);
  }

  Future<void> orderNow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int wallet = prefs.getInt('walletAmount') ?? 200;
    int orderAmount = totlaPrice.toInt();

    if (wallet < orderAmount) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Insufficient Wallet Balance")),
      );
      return;
    }

    wallet -= orderAmount;
    prefs.setInt('walletAmount', wallet);

    List<String> transactions =
        prefs.getStringList('transactions') ?? [];
    transactions.insert(0, "DEBIT,$orderAmount");
    prefs.setStringList('transactions', transactions);

    List<String> orders = prefs.getStringList('orders') ?? [];
    orders.insert(0, "${widget.productname},$quantity,$orderAmount");
    prefs.setStringList('orders', orders);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Order()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 198, 242),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 30, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),

            Image.asset(
              "images/medicine_image.png",
              height: MediaQuery.of(context).size.height / 2.5,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 234, 234),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Text(widget.productname,
                          style: AppWidgets.headLineTextStyle(20)),
                      const Spacer(),
                      quantityWidget(),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text("Description",
                      style: AppWidgets.lightTextStyle(21)),
                  const SizedBox(height: 10),
                  Text(widget.detail),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Price",
                              style: AppWidgets.headLineTextStyle(20)),
                          Text("₹${totlaPrice.toStringAsFixed(2)}",
                              style: AppWidgets.lightTextStyle(18)),
                        ],
                      ),

                      GestureDetector(
                        onTap: orderNow,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Order Now",
                              style: AppWidgets.whiteTextStyle(20)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget quantityWidget() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (quantity > 1) {
              quantity--;
              totlaPrice -= double.parse(widget.price);
              setState(() {});
            }
          },
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        Text(quantity.toString(),
            style: AppWidgets.headLineTextStyle(18)),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            quantity++;
            totlaPrice += double.parse(widget.price);
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
