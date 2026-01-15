import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacyapp/pages/bottom_nav.dart';
import 'package:pharmacyapp/pages/signup.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool isLoading = false;

  String? email;
  String? password;

  userLogin() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } on FirebaseAuthException {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Invalid username or password",
            style: AppWidgets.whiteTextStyle(20),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xfff7bc3c),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  "Hello",
                  style: GoogleFonts.fredoka(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Welcome back!",
                  style: GoogleFonts.fredoka(fontSize: 20),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 4,
              left: 20,
              right: 20,
              bottom: 70,
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 240, 247, 234),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                Center(
                  child: Text(
                    "Login Account",
                    style: GoogleFonts.fredoka(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Text("Email Address",
                    style: GoogleFonts.fredoka(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your email address",
                      suffixIcon: Icon(Icons.email),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Text("Password",
                    style: GoogleFonts.fredoka(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your password",
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                GestureDetector(
                  onTap: () {
                    if (emailcontroller.text.isNotEmpty &&
                        passwordcontroller.text.isNotEmpty) {
                      email = emailcontroller.text;
                      password = passwordcontroller.text;
                      userLogin();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xfff7bc3c),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : Text(
                              "Login Account",
                              style: GoogleFonts.fredoka(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Signup()),
                      );
                    },
                    child: Text(
                      "Create New Account",
                      style: GoogleFonts.fredoka(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
