import 'package:ecommerceapp/routes/app_routes.dart';
import 'package:ecommerceapp/screen/googleSignin/provider/auth_provider.dart';
import 'package:ecommerceapp/screen/homeScreen/view/homeScreen.dart';
import 'package:ecommerceapp/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  InputDecoration _textField(String hint){
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade200,
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Image.asset(
                    'assets/image/loginicon1.png',
                    height: SizeConfig.screenHeight * 0.2,
                  ),
                  SizedBox(height: 20,),

                  Text('LogIn',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color:  Colors.black
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 4),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Name',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1),
                  TextField(
                    controller: nameController,
                    decoration: _textField('Enter Your Name'),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 3),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1),

                  TextField(
                    controller: emailController,
                    decoration: _textField('Enter Your Email'),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 3),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Password',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                SizedBox(height: SizeConfig.blockHeight * 1),

                  TextField(
                    controller: passController,
                    decoration: _textField('Enter Your Password'),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 8),

                  auth.loading ?
                  CircularProgressIndicator() : SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                      ),
                        onPressed: ()async{
                          final user = await auth.loginEmail(
                              emailController.text.trim(),
                            passController.text.trim(),
                          );
                          if(user != null && context.mounted){
                            Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.home,
                            );
                          }
                        },
                        child: Text('Sign up',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  auth.loading ? SizedBox() : GestureDetector(
                    onTap: ()async{
                      final user = await auth.signInWithGoogle();
                      if(user != null && context.mounted){
                        Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.home,
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey),
                        color: Colors.deepPurpleAccent
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              'assets/image/google4.png',
                            height: 25,
                          ),
                          SizedBox(width: 10,),
                          Text('Signin with google',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: SizeConfig.blockHeight * 17)
                ],
              ),
            ),
        ),
      ),
    );
  }
}
