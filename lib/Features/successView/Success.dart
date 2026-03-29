// success_screen.dart

import 'package:flutter/material.dart';
import 'package:hungry_resturant/Features/Home/View/Home.dart';
import 'package:hungry_resturant/Features/Home/widgets/root.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
     
      backgroundColor: AppColor.mainColor, 

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            
            width: screenWidth * 0.8, 
            constraints: const BoxConstraints(maxWidth: 400), 
            
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // ظل خفيف
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: <Widget>[
               
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.green.shade600, 
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
                
                const SizedBox(height: 16.0),
                
              
                const Text(
                  'Success!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, 
                  ),
                ),
                
                const SizedBox(height: 8.0),
                
                
                const Text(
                  'Your payment was successful. A receipt for this purchase has been sent to your email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey, 
                  ),
                ),
                
                const SizedBox(height: 24.0),
                
                
                SizedBox(
                  width: double.infinity, 
                  child: ElevatedButton(
                    onPressed: () {
                     
                      Navigator.pushReplacement(
                        context, MaterialPageRoute(
                          builder: (context)=>Root())); 
                    },
                    style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.mainColor,
                 foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                      ),
                      elevation: 0, 
                    ),
                    child: const Text(
                      'Go Back',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

