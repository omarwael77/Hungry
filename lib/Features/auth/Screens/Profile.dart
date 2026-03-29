// ignore_for_file: use_key_in_widget_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:hungry_resturant/Features/auth/Screens/Login.dart';
import 'package:hungry_resturant/Features/auth/widgets/textfieldModel.dart';
import 'package:hungry_resturant/Features/auth/data/auth_repo/repo.dart';

import 'package:hungry_resturant/Features/auth/data/user_model.dart';
import 'package:hungry_resturant/Features/splashscreen/Splashview.dart';
import 'package:hungry_resturant/Shared/Widgts/elevatedButton.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';
import 'package:hungry_resturant/core/network/api_error.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserModel? userModel;
  AuthRepo authRepo = AuthRepo();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  Future<void> getProfile() async {
  try {
    final user = await authRepo.getProfile();
    setState(() {
      userModel = user;

      
      nameController.text = user?.name ?? "";
emailController.text = user?.email ?? "";
passwordController.text = "********";


      isLoading = false;
    });
  } catch (e) {
    String errorMessage = "Error in Profile-View";
    if (e is ApiError) {
      errorMessage = e.message;
    }

    if (!mounted) return; // مهم جدًا قبل استخدام context
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorMessage)));

    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.mainColor,
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.01),

          // !Image
            // Center(
            //   child: Container(
            //     width: screenWidth * 0.4,
            //     height: screenHeight * 0.2,
            //     decoration: BoxDecoration(
            //       color: Colors.grey,
            //       border: Border.all(color: Colors.white, width: 3),
            //       image: DecorationImage(
            //         image: userModel?.image != null
            //             ? NetworkImage(userModel!.image!)
            //             : AssetImage("Media/defualt.jpg") as ImageProvider,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     child: isLoading
            //         ? Center(
            //             child: CircularProgressIndicator(
            //               color: Colors.white,
            //             ),
            //           )
            //         : null,
            //   ),
            // ),

            SizedBox(height: screenHeight * 0.05),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: textfeild_Model(
                hint: "Name",
                obsac: false,
                controller: nameController,
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            // الايميل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: textfeild_Model(
                hint: "Email",
                obsac: false,
                controller: emailController,
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: textfeild_Model(
                hint: "Password",
                obsac: true,
                controller: passwordController,
              ),
            ),

            SizedBox(height: screenHeight * 0.05),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  elevatedModel(
                    title: "Edit Profile",
                    onPressed: () {
                      
                    },
                    fore: AppColor.mainColor,
                    back: Colors.white,
                  ),
                  elevatedModel(
  title: "Log-out",
  onPressed: () async {
    setState(() {
      isLoading = true;
    });
    await authRepo.logout();  
    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=>Login())) ;
  },
  fore: AppColor.mainColor,
  back: Colors.white,
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
