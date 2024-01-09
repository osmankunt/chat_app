import 'package:chat_app/chat_page.dart';
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

      Navigator.pushNamed(context, '/chat', arguments: usernameController.text);
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
        title: Text("Chat App"),
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
                const Text(
                  "Let's sign you in",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Type your message here",
                  style: TextStyle(color: Colors.brown, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                Image.network(
                  "https://3009709.youcanlearnit.net/Alien_LIL_131338.png",
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isNotEmpty && value.length < 5) {
                            return "please put at least 5 chars to username field";
                          } else if (value != null && value.isEmpty) {
                            return "please type username";
                          }
                          return null;
                        },
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Username",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Password",
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      loginUser(context);
                    },
                    child: Text('Login')),
                SizedBox(
                  height: 20,
                ),
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
