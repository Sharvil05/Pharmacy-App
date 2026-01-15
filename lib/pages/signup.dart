// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pharmacyapp/pages/home.dart';
// import 'package:pharmacyapp/pages/login.dart';
// import 'package:pharmacyapp/services/database.dart';
// import 'package:pharmacyapp/services/shared_pref.dart';
// import 'package:pharmacyapp/widgets/support_widget.dart';
// import 'package:random_string/random_string.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {

//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();

//   bool loading=false;

//   String? name;
//   String? email;
//   String? password;

//   // Registration Function

//   registration()async{
//     setState(() {
//       loading=true;
//     });

//     try{
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
//       String id = randomAlphaNumeric(10);

//       Map<String,dynamic> userInfoMap={
//         "Name":namecontroller,
//         "Email":emailcontroller,
//         "id":id
//       };
//       // Save all thisngs Locally below
//       await ShaedPrefrenceHelper().saveUserId(id);
//       await ShaedPrefrenceHelper().saveUserName(name!);
//       await ShaedPrefrenceHelper().saveUserEmail(email!);

//       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){

//         return Home();
//       }));

//       // add user data to firebase below
//       await DatabaseMethods().addUserInfo(userInfoMap, id);
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.green,
//             content: Text("Registered Sucessfully!..",style: AppWidgets.whiteTextStyle(20),))
//         );


//     }on FirebaseAuthException catch(e){
      
//       if(e.code=="weak-passoword"){
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.red,
//             content: Text("Password Provided is to week",style: AppWidgets.whiteTextStyle(20),))
//         );
//       }else if(e.code=="email-already-in-used"){

//           ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.red,
//             content: Text("Email is already in used",style: AppWidgets.whiteTextStyle(20),))
//         );

//       }
//     }
//   }

//   @override
//  Widget build(BuildContext context) {
//     return Scaffold(

//       body: Container(
//         child: Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height/2,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Color(0xfff7bc3c),
//                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60))
//               ),
//               child: Column(
                
//                 children: [
//                   SizedBox(height: 30,),
//                   Text("Join Us",style: GoogleFonts.fredoka(
//                     color: Colors.black,
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold
//                   ),),
//                   Text("Create Free Account",style: GoogleFonts.fredoka(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w400
//                   ),)
//                 ],
                
//               ),
              
//             ),
//              Container(
//               padding: EdgeInsets.only(left: 20,right: 20),
//               width: MediaQuery.of(context).size.width,
//               margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4,left: 20.0,right: 20.0,bottom: 70),
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 240,247, 234),
//                 borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30))
//               ),
//               child: Column(
                
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 20,),

//                  Center(
//                    child: Text("Personal Info",style: GoogleFonts.fredoka(
//                       color: Colors.black,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold
//                     ),),
//                  ),
//                   SizedBox(height: 5.0,),

//                   Padding(
//                     padding: const EdgeInsets.only(left: 15,right: 15),
//                     child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",textAlign: TextAlign.center,),
//                   ),
//                   SizedBox(height: 30,),
//                    Text("Full Name",style: GoogleFonts.fredoka(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold
//                   ),),
//                   SizedBox(height: 10,),
                  
//                   Container(
//                     padding: EdgeInsets.only(left: 20.0),
//                     decoration: BoxDecoration(
//                       //color: Colors.white,
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: Colors.black)
//                     ),
//                     child: TextField(
//                       controller: namecontroller,
//                       decoration: InputDecoration(
                        
//                         border: InputBorder.none,
//                         hintText: "Enter your name",
//                         suffixIcon: Icon(Icons.person)
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30,),

//                   Text("Email Address",style: GoogleFonts.fredoka(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold
//                   ),),
//                   SizedBox(height: 10,),

//                   Container(
//                     padding: EdgeInsets.only(left: 20.0),
//                     decoration: BoxDecoration(
//                       //color: Colors.white,
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: Colors.black)
//                     ),
//                     child: TextField(
//                       controller: emailcontroller,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Enter your email address",
//                         suffixIcon: Icon(Icons.email)
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 30,),

//                   Text("Password",style: GoogleFonts.fredoka(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold
//                   ),),
//                   SizedBox(height: 10,),

//                    Container(
//                     padding: EdgeInsets.only(left: 20.0),
//                     decoration: BoxDecoration(
//                       //color: Colors.white,
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: Colors.black)
//                     ),
//                     child: TextField(
//                       obscureText: true,
//                       controller: passwordcontroller,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Enter you password",
                      
//                       ),
//                     ),
//                   ),

//                  SizedBox(height: 30,),
//                  GestureDetector(
//                   onTap: () {
//                     // Handle Create Account logic

//                     if(namecontroller.text!=""&&emailcontroller.text!=""&&passwordcontroller.text!=""){

//                       setState(() {
//                         name=namecontroller.text;
//                         email=emailcontroller.text;
//                         password=passwordcontroller.text;
//                       });

//                       registration();
//                     }
//                   },

//                    child: Container(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       color: Color(0xfff7bc3c),
//                       borderRadius: BorderRadius.circular(25)
//                     ),
//                     child: Center(
//                       child: loading? Center(child: CircularProgressIndicator(color: Colors.black,)) : Text("Create Account",style: GoogleFonts.fredoka(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold
//                       ),),
//                     ),
//                    ),
//                  ),
//                  SizedBox(height: 20,),
//                  Center(
//                    child: GestureDetector(

//                     onTap: () {
                      
//                       Navigator.push(context, MaterialPageRoute(builder: (context){

//                         return Login();
//                       }));
//                     },
//                      child: Text("Back to Login ",style: GoogleFonts.fredoka(
//                             color: Colors.black,
//                             fontSize: 18,
                            
                           
//                           ),),
//                    ),
//                  ),
//                 ],
//               ),
//             )
           
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacyapp/pages/bottom_nav.dart';
import 'package:pharmacyapp/pages/login.dart';
import 'package:pharmacyapp/services/database.dart';
import 'package:pharmacyapp/services/shared_pref.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool loading = false;

  String? name;
  String? email;
  String? password;

  // 🔹 REGISTRATION FUNCTION (FIXED)
  registration() async {
    setState(() {
      loading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      String id = randomAlphaNumeric(10);

      // ✅ FIXED MAP
      Map<String, dynamic> userInfoMap = {
        "Name": name,
        "Email": email,
        "id": id,
      };

      // 🔹 SAVE LOCALLY
      await ShaedPrefrenceHelper().saveUserId(id);
      await ShaedPrefrenceHelper().saveUserName(name!);
      await ShaedPrefrenceHelper().saveUserEmail(email!);

      // 🔹 SAVE TO FIRESTORE
      await DatabaseMethods().addUserInfo(userInfoMap, id);

      setState(() {
        loading = false;
      });

      // ✅ IMPORTANT: BottomNav open karo
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BottomNav()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Registered Successfully!",
            style: AppWidgets.whiteTextStyle(20),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            e.message ?? "Registration Failed",
            style: AppWidgets.whiteTextStyle(20),
          ),
        ),
      );
    }
  }

  // 🔹 UI (UNCHANGED)
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
                  "Join Us",
                  style: GoogleFonts.fredoka(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Create Free Account",
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
                    "Personal Info",
                    style: GoogleFonts.fredoka(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Text("Full Name",
                    style: GoogleFonts.fredoka(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                inputBox(namecontroller, "Enter your name", Icons.person),

                const SizedBox(height: 30),

                Text("Email Address",
                    style: GoogleFonts.fredoka(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                inputBox(emailcontroller, "Enter your email", Icons.email),

                const SizedBox(height: 30),

                Text("Password",
                    style: GoogleFonts.fredoka(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                inputBox(passwordcontroller, "Enter your password", null,
                    obscure: true),

                const SizedBox(height: 30),

                GestureDetector(
                  onTap: () {
                    if (namecontroller.text.isNotEmpty &&
                        emailcontroller.text.isNotEmpty &&
                        passwordcontroller.text.isNotEmpty) {
                      name = namecontroller.text;
                      email = emailcontroller.text;
                      password = passwordcontroller.text;
                      registration();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xfff7bc3c),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: loading
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : Text(
                              "Create Account",
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Login()),
                      );
                    },
                    child: Text(
                      "Back to Login",
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

  Widget inputBox(
      TextEditingController controller, String hint, IconData? icon,
      {bool obscure = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}
