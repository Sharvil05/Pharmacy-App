
// Admin is used 
// Because It can add the medicines that can be show to the user

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacyapp/admin/add_product.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xfff7bc3c),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60))
              ),
              child: Column(
                
                children: [
                  SizedBox(height: 30,),
                  Text("Admin Login",style: GoogleFonts.fredoka(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("Manage Complete App",style: GoogleFonts.fredoka(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),)
                ],
                
              ),
              
            ),
             Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4,left: 20.0,right: 20.0,bottom: 70),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240,247, 234),
                borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),

                 Center(
                  // Used Unique Id Because Random People Cannot take Login or Enter admin as in App
                   child: Text("Unique Id",style: GoogleFonts.fredoka(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                 ),
                  SizedBox(height: 5.0,),

                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 30,),

                  Text("User Name",style: GoogleFonts.fredoka(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),

                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black)
                    ),
                    child: TextField(

                      controller: userNameController,
                   
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your User Name",
                       
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),

                  Text("Password",style: GoogleFonts.fredoka(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),

                   Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black)
                    ),
                    child: TextField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter you password",
                      
                      ),
                    ),
                  ),
                 
                 SizedBox(height: 30,),
                 GestureDetector(

                  onTap: () {
                    
                    if(userNameController.text!=""&&passwordcontroller.text!=""){

                      loginAdmin();
                    }
                    
                  },
                   child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xfff7bc3c),
                      borderRadius: BorderRadius.circular(25)
                    ),

                    child: Center(
                      child:Text("Login Account",style: GoogleFonts.fredoka(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                   ),
                 ),
                ],
              ),
            )
           
          ],
        ),
      ),
    );
  }

// login Admin Function
  loginAdmin() {

    // It all are used to read the data of admin from the collection
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {

      snapshot.docs.forEach((result) {

        if (result.data()['id'] != userNameController.text.trim()) {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "UserName is Not Correct",
                style: AppWidgets.whiteTextStyle(20),
              ),
            ),
          );
        }else if(result.data()['password']!=passwordcontroller.text){

          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Your Paswrod is Not Correct",style: AppWidgets.whiteTextStyle(20),))
        );
        }else{

          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddProduct();
          }));
        }
      });
    });
  }
}