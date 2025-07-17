import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_app_test/constants.dart';
import 'package:login_app_test/widgets/custom_button.dart';
import 'package:login_app_test/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static final String routeName = 'RegisterPage';

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
              CustomTextField(hintText: 'Example@mail.com', lableText: 'Email'),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Enter your Password',
                lableText: 'Password',
              ),
              const SizedBox(height: 20),
              CustomButton(text: 'REGISTER'),

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
