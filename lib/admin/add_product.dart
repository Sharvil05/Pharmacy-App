import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacyapp/services/database.dart';
import 'package:pharmacyapp/widgets/support_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  // List of Items

  final List<String> productCategory=['Medicines','Suppliment','Herbal','Vitamins'];
  String? value;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController companyNameController= TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
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
                    Text("Add Product",style: GoogleFonts.fredoka(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                  
                ),
                
              ),
               Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/9,left: 20.0,right: 20.0,bottom: 70),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240,247, 234),
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
        
                  children: [
                    SizedBox(height: 20,),
        
                    Text("Medicine Name",style: GoogleFonts.fredoka(
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
                        controller: productNameController,
                        decoration: InputDecoration(
                          
                          border: InputBorder.none,
                          hintText: "Enter Product name",
                        ),
                      ),
                    ),
        
                    SizedBox(height: 30,),
                    Text("Product Price",style: GoogleFonts.fredoka(
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
                        controller: productPriceController,
                        decoration: InputDecoration(
                          
                          border: InputBorder.none,
                          hintText: "Enter Product Price",
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text("Product Category",style: GoogleFonts.fredoka(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    Container(
        
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
        
                      // call List Here below
                      // Call onMap with toString
        
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value,
                          items: productCategory.map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: AppWidgets.headLineTextStyle(18),
                              ),
                            ),
                          ).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              this.value = value;
                            });
                          },
                          hint: Text("Select Category"),
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          iconSize: 36,
                        ),
                      ),
        
        
        
                    ),
                    SizedBox(height: 30,),
                    Text("Company Name",style: GoogleFonts.fredoka(
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
                        controller: companyNameController,
                        decoration: InputDecoration(
                          
                          border: InputBorder.none,
                          hintText: "Enter Company Name",
                        ),
                      ),
                    ),
        
                    SizedBox(height: 30,),
                    Text("Product Description",style: GoogleFonts.fredoka(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                      ),
                      child: TextField(
                        controller: productDescriptionController,
                        maxLines: 8,
                        decoration: InputDecoration(
                          
                          border: InputBorder.none,
                          hintText: "Write About Product ",
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
        
                     GestureDetector(
                    onTap: () async{

                     

                      if(productNameController.text!=""&&
                        productPriceController.text!=""&&
                        companyNameController.text!=""&&
                        productDescriptionController.text!=""
                      ){
                         // Pass Add Product Map Here
                        Map<String,dynamic> addProduct = {
                          "Name":productNameController.text,
                          "Price":productPriceController.text,
                          "Category":value,
                          "CompanyName":companyNameController.text,
                          "Description":productDescriptionController.text
                        };

                      await DatabaseMethods().addProduct(addProduct);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Product Added Sucessfully..",style: AppWidgets.whiteTextStyle(20),))
                      );
                    }else{

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Please Filled All Details",style: AppWidgets.whiteTextStyle(20),))
                      );
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
                        child:Text("Add Product",style: GoogleFonts.fredoka(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                     ),
                   ),
        
        
                  ],
                ))
        
              
        
        
            ],
          ),
        ),
      ),

    );
  }
}