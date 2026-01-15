// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pharmacyapp/pages/detail_page.dart';
// import 'package:pharmacyapp/services/database.dart';
// import 'package:pharmacyapp/widgets/support_widget.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   bool allmedicine = true, supplement=false,vitamins=false,herbal=false;
  
  
//   Stream? productStream;

//   getonload()async{

//     productStream = await DatabaseMethods().getallProducts(
// "Medicines");

// setState(() {
  
// });
//   }

//   void initState(){
//     super.initState();

//     getonload();
//   }

//   Widget allProducts(){

//     return StreamBuilder(
      
//       stream: productStream, 
      
      
//       builder: (context,AsyncSnapshot snapshot){
//         // check the the documnet has or not in database
//         return snapshot.hasData? ListView.builder(
//           shrinkWrap: true, 
//           physics: NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.zero,
//           itemCount: snapshot.data.docs.length,  // Help to keep all count of the  document that have present  with respective colection
//           itemBuilder: (context, index){              // Context , Index is help to read all documnet one by one
          
//           DocumentSnapshot ds = snapshot.data.docs[index];
//           return GestureDetector(

//             onTap: () {
//               Navigator.push(context, (MaterialPageRoute(builder: (context){

//                 return DetailPage(productname: ds["Name"], detail: ds["Description"], price: ds["Price"]);
//               })));
//             },
//             child: Container(
//                   margin: EdgeInsets.only(right: 20, bottom: 20),
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color(0xffbab3a6),
//                         Color(0xffddd7cd),
//                         Color(0xffe59c8f),
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Stack(
//                     children: [
            
//                       /// IMAGE (YOUR ASSET IMAGE)
//                       Center(
//                         child: Image.asset(
//                           "images/medicine_image.png",
//                           height: 300,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
            
//                       /// FIRESTORE TEXT
//                       Positioned(
//                         left: 20,
//                         bottom: 10,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.6),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(ds["Name"], style: AppWidgets.whiteTextStyle(15)),
//                                   SizedBox(width: 100),
//                                   Text("\$${ds["Price"]}", style: AppWidgets.whiteTextStyle(20)),
//                                 ],
//                               ),
//                               Text(ds["CompanyName"], style: AppWidgets.whiteTextStyle(20)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//           );



//           }):  
//         Container(

//         );

//       });
//   }
  
  
  
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 201, 198, 242),

//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.only(top: 50.0,left: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
        
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(60),
//                 child: Image.asset("images/boy_image.jpeg",height: 70,width: 70,fit: BoxFit.cover,)),
//                 SizedBox(height: 30,),
//                 Text("Your Trusted",style: AppWidgets.headLineTextStyle(28),),
//                 Text("Online Pharmacy",style: AppWidgets.lightTextStyle(24)),
//                 SizedBox(height: 28,),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.only(left: 45),
//                        margin: EdgeInsets.only(right: 30),
                      
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 244, 244, 251),
//                           borderRadius: BorderRadius.circular(30),
//                           border: Border.all(color: Colors.white)
                          
                      
//                         ),
//                         child: Center(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Search Medicine...",hintStyle: AppWidgets.lightTextStyle(15),
//                               suffixIcon: Container(
//                                 margin: EdgeInsets.all(3),
                                
//                                 width: 100,
                              
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   borderRadius: BorderRadius.circular(30)
                                  
//                                 ),
//                                 child: Icon(Icons.search,color: Colors.white,),
//                               ),
//                             ),
                                              
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30,),
//                     Container(
//                       height: 40,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: [
        
//                           allmedicine? AppWidgets.selectedCategory("All Medicines"): GestureDetector(
//                             onTap: () async{
//                               allmedicine=true;
//                               supplement=false;
//                               vitamins=false;
//                               herbal=false;

//                           productStream = await DatabaseMethods().getallProducts("Medicines");
                              
//                               setState(() {
                                
//                               });
//                             },
//                             child: Container(
//                               height: 50,
//                               child: Center(child: Text("All Medicines",style: AppWidgets.lightTextStyle(20),)))),
        
//                             SizedBox(width: 30,),
//                             Container(
//                               height: 50,
//                               child: Center(
//                                 child: supplement? AppWidgets.selectedCategory("Suppliment"): GestureDetector(
//                                 onTap: () async{
//                                   allmedicine=false;
//                                   supplement=true;
//                                   vitamins=false;
//                                   herbal=false;

//                               productStream = await DatabaseMethods().getallProducts("Suppliment");

                                
//                                   setState(() {
                                    
//                                   });
//                                 },
//                                 child: Text("Suppliment",style: AppWidgets.lightTextStyle(20),)),
//                               ),
//                             ),
                            
//                             SizedBox(width: 30,),
//                             Container(
//                               height: 50,
//                               child: Center(
//                                 child: vitamins? AppWidgets.selectedCategory("Vitamins"): GestureDetector(
//                                 onTap: () async{
//                                   allmedicine=false;
//                                   supplement=false;
//                                   vitamins=true;
//                                   herbal=false;
                              
//                               productStream = await DatabaseMethods().getallProducts("Vitamins");

                                
//                                   setState(() {
                                    
//                                   });
//                                 },
//                                 child: Text("Vitamins",style: AppWidgets.lightTextStyle(20),)),
//                               ),
//                             ),
        
//                             SizedBox(width: 30,),
        
//                             Container(
//                               height: 50,
//                               child: Center(
//                                 child: herbal? AppWidgets.selectedCategory("Herbal"): GestureDetector(
//                                 onTap: () async{
//                                   allmedicine=false;
//                                   supplement=false;
//                                   vitamins=false;
//                                   herbal=true;

//                           productStream = await DatabaseMethods().getallProducts("Herbal");

                                
//                                   setState(() {
                                    
//                                   });
//                                 },
//                                 child: Text("Herbal",style: AppWidgets.lightTextStyle(20),)),
//                               ),
//                             ),
        
                           
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 30,),

//                   allProducts()
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }              

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacyapp/pages/detail_page.dart';
import 'package:pharmacyapp/services/database.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool allmedicine = true, supplement = false, vitamins = false, herbal = false;

  Stream? productStream;

  TextEditingController searchController = TextEditingController();
  String searchText = "";
  String selectedCategory = "Medicines";

  // ---------------- LOAD DATA ----------------
  getonload() async {
    productStream =
        await DatabaseMethods().getallProducts(selectedCategory);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getonload();
  }

  // ---------------- PRODUCT LIST ----------------
  Widget allProducts() {
    return StreamBuilder(
      stream: productStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(
                          productname: ds["Name"],
                          detail: ds["Description"],
                          price: ds["Price"],
                        );
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffbab3a6),
                            Color(0xffddd7cd),
                            Color(0xffe59c8f),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "images/medicine_image.png",
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(ds["Name"],
                                          style:
                                              AppWidgets.whiteTextStyle(15)),
                                      SizedBox(width: 80),
                                      Text("\$${ds["Price"]}",
                                          style:
                                              AppWidgets.whiteTextStyle(20)),
                                    ],
                                  ),
                                  Text(ds["CompanyName"],
                                      style:
                                          AppWidgets.whiteTextStyle(18)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

  // ---------------- BUILD ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 198, 242),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  "images/boy_image.jpeg",
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 30),
              Text("Your Trusted",
                  style: AppWidgets.headLineTextStyle(28)),
              Text("Online Pharmacy",
                  style: AppWidgets.lightTextStyle(24)),
              SizedBox(height: 28),

              // ---------------- SEARCH ----------------
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 45),
                      margin: EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 244, 251),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) async {
                          searchText = value;

                          if (searchText.isEmpty) {
                            productStream =
                                await DatabaseMethods()
                                    .getallProducts(selectedCategory);
                          } else {
                            productStream =
                                await DatabaseMethods()
                                    .searchProducts(
                                        searchText, selectedCategory);
                          }
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Medicine...",
                          hintStyle: AppWidgets.lightTextStyle(15),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child:
                                Icon(Icons.search, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // ---------------- CATEGORY ----------------
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryButton("All Medicines", "Medicines"),
                    SizedBox(width: 30),
                    categoryButton("Suppliment", "Suppliment"),
                    SizedBox(width: 30),
                    categoryButton("Vitamins", "Vitamins"),
                    SizedBox(width: 30),
                    categoryButton("Herbal", "Herbal"),
                  ],
                ),
              ),

              SizedBox(height: 30),
              allProducts(),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- CATEGORY BUTTON ----------------
  Widget categoryButton(String title, String category) {
    bool isSelected = selectedCategory == category;

    return GestureDetector(
      onTap: () async {
        selectedCategory = category;
        searchController.clear();

        productStream =
            await DatabaseMethods().getallProducts(category);
        setState(() {});
      },
      child: isSelected
          ? AppWidgets.selectedCategory(title)
          : Text(title, style: AppWidgets.lightTextStyle(20)),
    );
  }
}
