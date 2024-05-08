import 'package:flutter/material.dart';
import 'widgets/input_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'register_page.dart';
import '/controllers/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthenticationController authenticationController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Login Page',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: 'Username',
                controller: usernameController,
                obscureText: false,
              ),
              const  SizedBox(height: 20),
              InputWidget(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              const  SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  await authenticationController.login(
                    username: usernameController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
                child:  Obx(() {
                  return  authenticationController.isLoading.value ? const CircularProgressIndicator(color: Colors.white,) :
                     Text('Login' , style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),);
                  }
                ),
              ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?', style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                    ),),
                    TextButton(
                      onPressed: () {Get.to(() => const RegisterPage());},
                      child:  Text('Register', style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.blue,
                      ),),
                    ),
                  ],
                ),
            ]
          ),
        ),
      ),
    );
  }
}
