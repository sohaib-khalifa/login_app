import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_app_test/widgets/custom_button.dart';
import 'package:login_app_test/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(flex: 1),
              SvgPicture.asset('assets/images/login.svg', height: 300),
              Text(
                'Welcome',
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                ),
              ),
              Spacer(flex: 1),
              Row(
                children: [
                  Text(
                    'login',
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
              CustomButton(text: 'Sign in'),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have account ?  ',
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
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
