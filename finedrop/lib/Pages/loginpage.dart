import 'package:finedrop/main.dart';
import 'package:flutter/material.dart';
import 'package:finedrop/Pages/signuppage.dart';
import 'package:finedrop/model/color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/FineDrop.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Log In',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Log in to your account',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(24.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  // color: AppColors.surfaceColor,
                  // border: Border.all(
                  //   color: AppColors.primaryColor,
                  //   width: 1.0,
                  // )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //usernme Field
                    TextField(
                      decoration: InputDecoration(
                        fillColor: AppColors.backgroundColor,
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 15,
                        ),

                        labelText: 'Username', // Label for the text field
                        hintText:
                            'Enter Your Name ...', // Hint text inside the text field
                        border: const OutlineInputBorder(), // Outline border
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 2.0), // Border when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: const BorderSide(
                              color: AppColors.secondaryColor,
                              width: 1.0), // Border when enabled
                        ),
                      ),
                    ),

                    const SizedBox(height: 16.0),

                    // password Field
                    TextField(
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.key,
                          size: 15,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off, // Toggle icon
                            size: 18,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured; // Toggle visibility
                            });
                          },
                        ),
                        labelText: 'Password', // Label for the text field
                        hintText:
                            'Enter Your Password ...', // Hint text inside the text field
                        border: const OutlineInputBorder(), // Outline border
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 2.0), // Border when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: const BorderSide(
                              color: AppColors.secondaryColor,
                              width: 1.0), // Border when enabled
                        ),
                      ),
                    ),

                    const SizedBox(height: 16.0),

                    const SizedBox(height: 16.0),

                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MySccaffold()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.primaryColor, // Custom green
                          foregroundColor: AppColors.textSecondary,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          elevation: 5,
                        ),
                        child: const Center(
                          child: Text('Log in'),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('New to FineDrop? '), // Regular text
                        GestureDetector(
                          onTap: () {
                            // Navigate to the Sign In page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors
                                  .blue, // Change color to indicate it's clickable
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
