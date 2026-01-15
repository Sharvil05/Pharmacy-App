import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidgets{

  static TextStyle headLineTextStyle(double size){
      return GoogleFonts.poppins(
                fontSize: size,
                color: Colors.black,
                fontWeight: FontWeight.bold
    );
  }

  static TextStyle lightTextStyle(double size){

    return GoogleFonts.poppins(
                fontSize: size,
                color: Colors.black
    );
  }

  static Widget selectedCategory(String name){

    return Material(
        elevation: 3.0,  // From Elevation the border can e heighlighted
        borderRadius: BorderRadius.circular(35),
        child: Container(
         padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(35)
                                                
              ),
              child: Center(
                                child: Text(name,style:GoogleFonts.poppins(
                                
                                  fontSize: 18,
                                  color: Colors.white
                                )
                                
                                ),
                              ),
                            ),
                          );

  }

    static TextStyle whiteTextStyle(double size){
      return GoogleFonts.poppins(
                fontSize: size,
                color: Colors.white,
                fontWeight: FontWeight.bold
    );

   
  }
}