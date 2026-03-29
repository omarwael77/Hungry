import 'package:flutter/material.dart';

class elevatedModel extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color fore;
  final Color back;

  const elevatedModel({
    super.key,
    required this.title,
    required this.onPressed,
    required this.fore,
    required this.back
  });

  @override
  Widget build(BuildContext context) {
   
    return ElevatedButton(
      onPressed: () {
       onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: back,
        foregroundColor: fore,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // 0 لو عايز حواف تمامًا شارب
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
      
    
  }
}