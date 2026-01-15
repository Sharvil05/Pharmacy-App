// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:pharmacyapp/pages/login.dart';
// import 'package:pharmacyapp/pages/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     super.initState();
//     goNext();
//   }

//   void goNext() {
//     Timer(const Duration(seconds: 3), () {
//       // 🔹 if user already logged in → Home
//       if (FirebaseAuth.instance.currentUser != null) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const Home()),
//         );
//       } 
//       // 🔹 else → Login
//       else {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const Login()),
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 201, 198, 242),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [

//             // 🔹 APP LOGO / IMAGE
//             Image.asset(
//               "images/splash.jpeg", // ya apna logo
//               height: 150,
//             ),

//             const SizedBox(height: 30),

//             // 🔹 APP NAME
//             const Text(
//               "Online Pharmacy",
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 10),

//             const Text(
//               "Your Trusted Medical Partner",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black54,
//               ),
//             ),

//             const SizedBox(height: 40),

//             // 🔹 LOADING
//             const CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmacyapp/pages/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goNext();
  }

  void goNext() {
    Timer(const Duration(seconds: 3), () {
      // 🔹 ALWAYS GO TO SIGNUP
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Signup()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 198, 242),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              "images/Farmacia.png",
              height: 150,
            ),

            const SizedBox(height: 30),

            const Text(
              "Online Pharmacy",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Your Trusted Medical Partner",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 40),

            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
