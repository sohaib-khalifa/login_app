import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_app_test/constants.dart';
import 'package:login_app_test/widgets/custom_button.dart';
import 'package:login_app_test/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static final String routeName = 'RegisterPage';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xff2B475E),
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Spacer(flex: 1),
              const SizedBox(height: 20),
              SvgPicture.asset('assets/images/login.svg', height: 300),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
              // Spacer(flex: 1),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Example@mail.com',
                lableText: 'Email',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Enter your Password',
                lableText: 'Password',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () async {
                  // try {
                  //   UserCredential user = await FirebaseAuth.instance
                  //       .createUserWithEmailAndPassword(
                  //         email: email!,
                  //         password: password!,
                  //       );

                  //   if (context.mounted) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         backgroundColor: Colors.green,
                  //         content: Text('Account created successfully!'),
                  //       ),
                  //     );
                  //   }

                  //   // ممكن هنا تضيف Navigator لو حبيت تروح لصفحة معينة
                  //   // Navigator.pushNamed(context, 'LoginPage');
                  // } on FirebaseAuthException catch (e) {
                  //   if (context.mounted) {
                  //     String errorMessage = '';

                  //     if (e.code == 'weak-password') {
                  //       errorMessage = 'The password is too weak.';
                  //     } else if (e.code == 'email-already-in-use') {
                  //       errorMessage = 'The email is already in use.';
                  //     } else if (e.code == 'invalid-email') {
                  //       errorMessage = 'The email format is invalid.';
                  //     } else {
                  //       errorMessage = e.message ?? 'Something went wrong.';
                  //     }

                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         backgroundColor: Colors.red,
                  //         content: Text(errorMessage),
                  //       ),
                  //     );
                  //   }
                  // } catch (e) {
                  //   if (context.mounted) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         backgroundColor: Colors.red,
                  //         content: Text('Unexpected error: $e'),
                  //       ),
                  //     );
                  //   }
                  // }
                  // =========================
                  if (email == null ||
                      email!.isEmpty ||
                      password == null ||
                      password!.isEmpty) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Email or password cannot be empty.'),
                      ),
                    );
                    return;
                  }

                  // ✅ تحقق من وجود @ في الإيميل
                  if (!email!.contains('@')) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please enter a valid email address.'),
                      ),
                    );
                    return;
                  }

                  try {
                    UserCredential user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                    if (!context.mounted) return; // ✅ تأكد إن context لسه شغال

                    // ✅ رسالة النجاح بعد ما يتم إنشاء الحساب
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Account created successfully!'),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (!context.mounted) {
                      return; // ✅ قبل استخدام context بعد await
                    }

                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('The password is too weak.'),
                        ),
                      );
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('The email is already in use.'),
                        ),
                      );
                    }
                  } catch (e) {
                    if (!context.mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Something went wrong. Please try again later.',
                        ),
                      ),
                    );
                  }
                  //====
                },
                text: 'REGISTER',
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?  ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  // Text(
                  //   '  Sign Up',
                  //   style: TextStyle(
                  //     color: Color(0xffC7EDE6),
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, 'LoginPage'); // problem
                      Navigator.pop(context); // Go back to the previous page
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              // Spacer(flex: 3),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
