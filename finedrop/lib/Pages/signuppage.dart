import 'package:finedrop/Pages/loginpage.dart';
import 'package:finedrop/model/color.dart';
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
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Image.asset(
                  'assets/FineDrop.png',
                  height: 130,
                  width: 200,
                ),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
                ),
                const Text(
                  'Ready for adventures? Join us',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
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
                          labelText: 'Username',
                          hintText: 'Enter Your Name ...',
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: AppColors.secondaryColor, width: 1.0),
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
                                  : Icons.visibility_off,
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                          labelText: 'Password',
                          hintText: 'Enter Your Password ...',
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: AppColors.secondaryColor, width: 1.0),
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
                                    : Icons.visibility_off,
                                size: 18),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter Your Password ...',
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: AppColors.secondaryColor, width: 1.0),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16.0),

                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
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
                          const Text('Already have an account? ',
                              style: TextStyle(fontSize: 15)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
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
          ),
        ),
      ),
    );
  }
}
