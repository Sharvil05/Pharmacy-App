import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharmacyapp/pages/home.dart';
import 'package:pharmacyapp/pages/order.dart';
import 'package:pharmacyapp/pages/profile.dart';
import 'package:pharmacyapp/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  // late is used because values are initialized in initState()
  late List<Widget> pages;

  late Home home;
  late Order order;
  late Wallet wallet;
  late Profile profile;

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();

    home = Home();
    order = Order();
    wallet = Wallet();
    profile = Profile();

    // Order of pages as per bottom navigation
    pages = [home, wallet, order, profile];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Color.fromARGB(255, 201, 198, 242),
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.wallet, color: Colors.white),
          Icon(Icons.shopping_bag, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),

      body: pages[currentTabIndex],
    );
  }
}






// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:pharmacyapp/pages/home.dart';
// import 'package:pharmacyapp/pages/order.dart';
// import 'package:pharmacyapp/pages/profile.dart';
// import 'package:pharmacyapp/pages/wallet.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {

//   // In List We Strore a Pages that I want to Used in Bottom Navigation
// // late is used to tell Dart that a variable will be initialized later, but before it is used.
  
//   late List<Widget> pages;

//   late Home home;
//   late Order order;
//   late Wallet wallet;
//   late Profile profile;

//   int currentTabIndex = 0;

//   // Assign Pages

//   void initState(){

//     home=Home();
//     order=Order();
//     wallet=Wallet();
//     profile=Profile();

//     pages=[home,wallet,order,profile]; // Here we can give order in which the pages are added in bottom Nvigation

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 60,
//         backgroundColor: Color.fromARGB(255, 201, 198, 242),
//         color: Colors.black,
//         animationDuration: Duration(milliseconds: 500),
//         onTap: (int index) {
//           currentTabIndex=index;
//           setState(() {
            
//           });
          
//         },
        
//         items: [

//           currentTabIndex==0?Icon(Icons.home,color: Colors.white,):Icon(Icons.home,color: Colors.white,),
//           currentTabIndex==1?Icon(Icons.wallet,color: Colors.white,):Icon(Icons.shopping_bag,color: Colors.white,),
//           currentTabIndex==2?Icon(Icons.shopping_bag,color: Colors.white,):Icon(Icons.wallet,color: Colors.white,),
//           currentTabIndex==3?Icon(Icons.person,color: Colors.white,):Icon(Icons.person,color: Colors.white,),
//         ]),

//         body: pages[
//           currentTabIndex
          
//         ],

//     );
//   }
// }