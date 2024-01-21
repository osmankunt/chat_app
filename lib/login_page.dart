import 'package:chat_app/utils/brand_color.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/utils/spacing.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Widget _buildHeader(context) {
    return Column(
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
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: const DecorationImage(fit: BoxFit.fitWidth, image: AssetImage("assets/illustration.png")),
              borderRadius: BorderRadius.circular(12)),
        ),
      ],
    );
  }

  Widget _buildFooter(context) {
    return Column(
      children: [
        GestureDetector(
          onDoubleTap: () {
            print('double tapped!!');
          },
          onLongPress: () {
            print('long pressed!!');
          },
          onTap: () async {
            print('the button clicked!!');
            if (!await launchUrl(Constants.urlConstant)) {
              throw Exception('Could not launch ${Constants.urlConstant}');
            }
          },
          child: Column(
            children: [
              const Text(
                'Find us on',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                Constants.urlConstant.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        verticalSpacing(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaButton.facebook(onTap: () async {
              if (!await launchUrl(Constants.socialUrlConstant)) {
                throw Exception('Could not launch ${Constants.socialUrlConstant}');
              }
            }),
            SocialMediaButton.instagram(
              onTap: () async {
                if (!await launchUrl(Constants.socialUrlConstant)) {
                  throw Exception('Could not launch ${Constants.socialUrlConstant}');
                }
              },
              size: 35,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForm(context) {
    return Form(
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
            if (constraints.maxWidth > 1000) {
              return Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        _buildHeader(context),
                        verticalSpacing(20),
                        _buildForm(context),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(child: _buildFooter(context)),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(context),
                verticalSpacing(20),
                _buildForm(context),
                verticalSpacing(20),
                _buildFooter(context),
              ],
            );
          }),
        ),
      ),
    );
  }
}
