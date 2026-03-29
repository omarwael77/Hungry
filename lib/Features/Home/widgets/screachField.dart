import 'package:flutter/material.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';


class searchFeild extends StatelessWidget {
  const searchFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5),
        hintText: "Search",
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(Icons.search,
        color: AppColor.mainColor,),
        filled: true,fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,color: Colors.black
          )
        ),
        focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 3,color: Colors.black
          )
    
        )
        
      ),
    );
  }
}