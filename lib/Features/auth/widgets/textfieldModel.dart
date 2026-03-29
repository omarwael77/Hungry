  import 'package:flutter/material.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';


  class textfeild_Model extends StatelessWidget {
    final String hint;
    bool obsac ;
    TextEditingController? controller;
  
   textfeild_Model({
    super.key,
    required this.hint,
    required this.obsac,
     this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      controller: controller,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      obscureText: obsac,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColor.mainColor,
        hintStyle: TextStyle
        (color: Colors.white,
        fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,width: 1
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,width: 3
          )
        )
      ),
    
    );
  }
}

