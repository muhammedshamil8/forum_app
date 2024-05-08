import 'package:flutter/material.dart';
import 'package:forumapp/controllers/authentication.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'widgets/input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthenticationController _authenticationController = Get.put(AuthenticationController());

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
                  'Register Page',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                InputWidget(
                  hintText: 'Name',
                  controller: _nameController,
                  obscureText: false,
                ),
                const  SizedBox(height: 20),
                InputWidget(
                  hintText: 'Username',
                  controller: _usernameController,
                  obscureText: false,
                ),
                const  SizedBox(height: 20),
                InputWidget(
                  hintText: 'Email',
                  controller: _emailController,
                  obscureText: false,
                ),
                const  SizedBox(height: 20),
                InputWidget(
                  hintText: 'Password',
                  controller: _passwordController,
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
                        await _authenticationController.register(
                          name: _nameController.text.trim(),
                          username: _usernameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                      },
                      child:      Obx( () {
                    return _authenticationController.isLoading.value ? const Center(
                      child: CircularProgressIndicator(),
                    )  : Text('Register' , style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),);
                      }),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account?', style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                    ),),
                    TextButton(
                      onPressed: () {Get.to(() => const LoginPage());},
                      child:  Text('Log In', style: GoogleFonts.poppins(
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
