// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Home/widgets/root.dart';
import 'package:hungry_resturant/Features/auth/widgets/textfieldModel.dart';
import 'package:hungry_resturant/Features/auth/data/Cubit/auth_cubit.dart';
import 'package:hungry_resturant/Features/auth/data/Cubit/auth_state.dart';
import 'package:hungry_resturant/Features/auth/data/auth_repo/repo.dart';

import 'package:hungry_resturant/Shared/Widgts/elevatedButton.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';


import 'Login.dart';

class Sgin extends StatefulWidget {
  const Sgin({super.key});

  @override
  State<Sgin> createState() => _SginState();
}

class _SginState extends State<Sgin> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  
  final TextEditingController passwordController = TextEditingController();

  AuthRepo authRepo = AuthRepo();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => AuthCubit(authRepo),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),

              
                Image.asset("Media/Hungry_.png",
                color: AppColor.mainColor,),
                
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Sign With Us To Discover Your Favourite Food",
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: screenHeight * 0.8,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      } else if (state is AuthSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Root()),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          textfeild_Model(
                            hint: "Your Name",
                            obsac: false,
                            controller: nameController,
                          ),
                          SizedBox(height: 25),
                          textfeild_Model(
                            hint: "Your Email",
                            obsac: false,
                            controller: emailController,
                          ),
                          SizedBox(height: 25),
                          textfeild_Model(
                            hint: "Your Password",
                            obsac: true,
                            controller: passwordController,
                             ),

                     SizedBox(height: 50),
        state is AuthLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: SizedBox(
                                    width: screenWidth,
                        child: elevatedModel(
             title: "Sign-Up",
               back: Colors.white,
                fore: Colors.black,
               onPressed: () {
              FocusScope.of(context).unfocus();
              context.read<AuthCubit>().signup(
                        nameController.text.trim(),
                       emailController.text.trim(),
                      passwordController.text.trim(),
                                            );
                                      },
                                    ),
                                  ),
                                ),

                           SizedBox(height: 20),
                          
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Login()));
                            },
                            child: Text(
               "Already have an account?\nJust Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
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
