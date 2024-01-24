import 'package:flutter/material.dart';
import 'package:flutter_firs_project/config/routes/route_names.dart';
import 'package:flutter_firs_project/features/auth/widgets/custom_button.dart';
import 'package:flutter_firs_project/features/auth/widgets/custom_input.dart';
import 'package:flutter_firs_project/features/auth/widgets/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mobilController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset("assets/svg/signUp.svg")),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF2E424D),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 900,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 170,
                                child: CustomInput(
                                  controller: _firstNameController,
                                  prefixIcon: Icons.person,
                                  text: "First Name",
                                  inputSize: 35,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 170,
                                child: CustomInput(
                                    controller: _lastNameController,
                                    prefixIcon: Icons.person,
                                    inputSize: 35,
                                    text: "Last Name"),
                              ),
                            ],
                          ),
                        ),
                        CustomInput(
                          controller: _usernameController,
                          prefixIcon: Icons.person,
                          text: "User Name",
                          inputSize: 35,
                        ),
                        CustomInput(
                          controller: _mobilController,
                          prefixIcon: Icons.local_phone_sharp,
                          text: "Mobil No",
                          inputSize: 35,
                        ),
                        CustomInput(
                          controller: _emailController,
                          prefixIcon: Icons.mail,
                          text: "E-mail",
                          inputSize: 35,
                        ),
                        CustomInput(
                          controller: _passwordController,
                          prefixIcon: Icons.key,
                          text: "Password",
                          inputSize: 35,
                          obsecureText: _isObscure,
                          suffixIcon: _isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          suffixIconOnpRess: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("Already have a account?",
                                style: TextStyle(color: Colors.white30)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteNames.signIn);
                                },
                                child: const CustomText(text: "Sign In")),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child:
                              CustomButton(text: "Sign Up", onPressed: (() {})),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
