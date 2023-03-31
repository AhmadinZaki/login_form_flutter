import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loginform/constant/const.dart';
import 'package:loginform/models/login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isPasswordVisible = false;
  bool remPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: const BoxDecoration(color: Colors.black),
        // decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 15,
            ),
            Text(
              'WELCOME',
              style: welcome,
            ),
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'By signing in you are agreeing our',
                    style: white14,
                  ),
                  Text(
                    'Term and privacy policy',
                    style: yelow14,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _email(),
                  const SizedBox(
                    height: 15,
                  ),
                  _password(),
                  const SizedBox(
                    height: 15,
                  ),
                  _changePassword(
                    press: () async {
                      print('Change Password');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buttonLogin(),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Login with touch ID',
                    style: white14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Finger Login');
                    },
                    child: SvgPicture.asset(
                      'assets/images/finger.svg',
                      height: 70,
                    ),
                  ),
                  Text(
                    'or Connect With',
                    style: white14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _outherLoginWith(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _outherLoginWith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            print('Login Fb');
          },
          child: SvgPicture.asset(
            'assets/images/fb.svg',
            height: 40,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        GestureDetector(
          onTap: () async {
            print('Login Instagram');
          },
          child: SvgPicture.asset(
            'assets/images/ig.svg',
            height: 40,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        GestureDetector(
          onTap: () async {
            print('Login Pintress');
          },
          child: SvgPicture.asset(
            'assets/images/pintres.svg',
            height: 40,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        GestureDetector(
          onTap: () async {
            print('Login linkedIn');
          },
          child: SvgPicture.asset(
            'assets/images/linkedin.svg',
            height: 40,
          ),
        ),
      ],
    );
  }

  FormBuilderTextField _email() {
    return FormBuilderTextField(
      name: 'email',
      maxLength: 70,
      style: white16,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Email tidak boleh kosong'),
        FormBuilderValidators.email(errorText: 'Email tidak valid')
      ]),
      decoration: InputDecoration(
        hintText: 'Email Address',
        hintStyle: fontInputs.copyWith(
          color: fontInputColor,
          fontSize: 16,
        ),
        prefixIcon: Transform.scale(
          scale: 0.6,
          child: SvgPicture.asset(
            'assets/images/mail.svg',
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: list)),
        errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: list)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: list)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: list)),
        counterText: "",
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  FormBuilderTextField _password() {
    return FormBuilderTextField(
      name: 'pass',
      style: white16,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
            errorText: 'Password tidak boleh kosong'),
      ]),
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: fontInputs.copyWith(
          color: fontInputColor,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: list)),
        errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: list)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: list)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: list),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        prefixIcon: Transform.scale(
          scale: 0.6,
          child: SvgPicture.asset(
            'assets/images/lock.svg',
          ),
        ),
        counterText: "",
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: fontInputColor,
          ),
          onPressed: () => setState(() {
            isPasswordVisible = !isPasswordVisible;
          }),
        ),
      ),
    );
  }

  MaterialButton _buttonLogin() {
    return MaterialButton(
      onPressed: () async {
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          var formData = _formKey.currentState?.value;

          var loginData = LoginRequest(
              email: formData?['email'], password: formData?['pass']);

          print(jsonEncode(loginData));
        } else {}
      },
      color: button,
      height: 56,
      elevation: 0,
      minWidth: 400,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: list, width: 1.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'login',
            style: white16,
          ),
          SvgPicture.asset('assets/images/login.svg')
        ],
      ),
    );
  }

  Widget _changePassword({required VoidCallback press}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            value: remPass,
            checkColor: Colors.white,
            activeColor: Colors.transparent,
            onChanged: (bool? value) async {
              setState(
                () {
                  remPass = value!;
                },
              );
            },
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Remember Password',
          style: white12,
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            'Forgot your password?',
            style: yelow12,
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
