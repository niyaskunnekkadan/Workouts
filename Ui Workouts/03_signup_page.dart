import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const ksized20 = SizedBox(height: 20);
const kdivider = Divider(color: Colors.transparent, height: 6);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
    );
  }
}

// Screen Homepage
class ScreenHome extends StatelessWidget {
  ScreenHome({
    super.key,
  });

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TitleText(title: 'Sign Up', align: Alignment.centerLeft),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      InputFieldKonstant(
                        hide: false,
                        inputType: TextInputType.name,
                        hintText: "username",
                        errorMsg: "username is required",
                        controller: userNameController,
                      ),
                      InputFieldKonstant(
                        hide: false,
                        inputType: TextInputType.emailAddress,
                        hintText: "email address",
                        errorMsg: "email is required",
                        controller: emailController,
                      ),
                      InputFieldKonstant(
                        hide: true,
                        inputType: TextInputType.visiblePassword,
                        hintText: "password",
                        errorMsg: "password is required",
                        controller: passwordController,
                      ),
                      InputFieldKonstant(
                        hide: true,
                        inputType: TextInputType.visiblePassword,
                        hintText: "Re password",
                        errorMsg: "password is required",
                        reCheck: (value) {
                          if (value != passwordController.text) {
                            return 'password invalid match';
                          }
                        },
                        controller: rePasswordController,
                      ),
                      ButtonKonst(
                          size: size, label: "Sign Up", formKey: formKey),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account?',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'SignIn',
                        style: TextStyle(
                          color: Colors.blue[600],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widgets custom Button,Inputfield,Text
class ButtonKonst extends StatelessWidget {
  const ButtonKonst({
    super.key,
    required this.size,
    required this.label,
    required this.formKey,
  });

  final Size size;
  final String label;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            print("working proper");
          }
        },
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.blue),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          elevation: const MaterialStatePropertyAll(0),
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 15, horizontal: size.width * .34)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

class InputFieldKonstant extends StatelessWidget {
  const InputFieldKonstant({
    super.key,
    required this.hintText,
    required this.errorMsg,
    required this.controller,
    this.reCheck,
    required this.inputType,
    required this.hide,
  });

  final String hintText;
  final String errorMsg;
  final TextEditingController controller;
  final Function(String? value)? reCheck;
  final TextInputType inputType;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMsg;
          } else {
            if (reCheck == null) {
              return null;
            } else {
              return reCheck!(value);
            }
          }
        },
        keyboardType: inputType,
        obscureText: hide,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(27),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54),
            borderRadius: BorderRadius.circular(32),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(32),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
    required this.align,
  });

  final String title;
  final AlignmentGeometry align;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      heightFactor: 2,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
    );
  }
}
