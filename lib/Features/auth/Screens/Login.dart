// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hungry_resturant/Features/Home/widgets/root.dart';
import 'package:hungry_resturant/Features/auth/Screens/Sgin.dart';
import 'package:hungry_resturant/Features/auth/widgets/textfieldModel.dart';
import 'package:hungry_resturant/Features/auth/data/Cubit/auth_cubit.dart';
import 'package:hungry_resturant/Features/auth/data/Cubit/auth_state.dart';
import 'package:hungry_resturant/Features/auth/data/auth_repo/repo.dart';
import 'package:hungry_resturant/Shared/Widgts/elevatedButton.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final TextEditingController emailController =
      TextEditingController(); // 
  final TextEditingController passwordController =
      TextEditingController(); //

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
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset(
                      "Media/Hungry_.png",
                      color: AppColor.mainColor,
                      height: 55,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
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
                            hint: "Your Email",
                            obsac: false,
                            controller: emailController,
                          ),

                          SizedBox(height: 30),

                          textfeild_Model(
                            hint: "Your Password",
                            obsac: true,
                            controller: passwordController,
                          ),


                          SizedBox(height: 40),

                          state is AuthLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : SizedBox(
                                  width: screenWidth,
                                  child: elevatedModel(
                                    title: "Login",
                                    back: Colors.white,
                                    fore: Colors.black,
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      context.read<AuthCubit>().login(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                          );
                                    },
                                  ),
                                ),
                          SizedBox(height: 25),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                          MaterialPageRoute(
                                builder: (_) => Sgin()));
                            },
                            child: Text(
                              "Don't have an account?\nCreate One",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
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
