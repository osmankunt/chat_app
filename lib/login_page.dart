import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:chat_app/utils/spacing.dart';
import 'package:chat_app/utils/theme_textstyle.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print(usernameController.text);
      print(passwordController.text);
      print('Logged in successfully!');

      Navigator.pushReplacementNamed(context, '/chat', arguments: usernameController.text);
    } else {
      print('the operation is not successful');
    }
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat App",
          style: TextStyle(color: BrandColor.textColor),
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Let's sign you in",
                  style: TextStyle(
                    fontSize: 30,
                    color: BrandColor.textColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Type your message here",
                  style: TextStyle(color: BrandColor.textColor, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                Image.network(
                  "https://3009709.youcanlearnit.net/Alien_LIL_131338.png",
                  height: 200,
                ),
                verticalSpacing(20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginTextField(
                        hintText: "User Name",
                        validator: (value) {
                          if (value != null && value.isNotEmpty && value.length < 5) {
                            return "please put at least 5 chars to username field";
                          } else if (value != null && value.isEmpty) {
                            return "please type username";
                          }
                          return null;
                        },
                        controller: usernameController,
                      ),
                      verticalSpacing(20),
                      LoginTextField(
                        isObscure: true,
                        hintText: "Password",
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                verticalSpacing(20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: BrandColor.buttonColor),
                  onPressed: () {
                    loginUser(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: BrandColor.textColor),
                  ),
                ),
                verticalSpacing(20),
                GestureDetector(
                  onDoubleTap: () {
                    print('double tapped!!');
                  },
                  onLongPress: () {
                    print('long pressed!!');
                  },
                  onTap: () {
                    print('the button clicked!!');
                  },
                  child: const Column(
                    children: [
                      Text(
                        'Find us on',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'https://ositech.co.uk',
                        style: TextStyle(fontSize: 16),
                      ),
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
