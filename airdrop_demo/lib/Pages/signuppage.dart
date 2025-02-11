import 'package:airdrop_demo/Pages/loginpage.dart';
import 'package:airdrop_demo/model/color.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.surfaceColor,
        body: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Create your account',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(24.0),
                width: double.infinity,
                height: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.backgroundColor,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.0,
                    )),
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
                    // confirm password
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
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured; // Toggle visibility
                            });
                          },
                        ),
                        labelText:
                            'Confirm Password', // Label for the text field
                        hintText:
                            'Re-enter Your Password ...', // Hint text inside the text field
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

                    ElevatedButton(
                        onPressed: () {},
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
                          child: Text('Register'),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '), // Regular text
                        GestureDetector(
                          onTap: () {
                            // Navigate to the Sign In page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            'Sign In',
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
