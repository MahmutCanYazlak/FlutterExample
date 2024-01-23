import 'package:flutter/material.dart';
import 'package:flutter_firs_project/config/routes/route_names.dart';
import 'package:flutter_firs_project/features/auth/widgets/custom_button.dart';
import 'package:flutter_firs_project/features/auth/widgets/custom_input.dart';
import 'package:flutter_firs_project/features/auth/widgets/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset("assets/svg/amico.svg")),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF2E424D),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 20,
                    blurStyle: BlurStyle.normal,
                    color: Colors.white12,
                    offset: Offset(-2, -3),
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    const CustomText(
                      text: "Glade to having you",
                    ),
                    CustomInput(
                        controller: _usernameController,
                        prefixIcon: Icons.person),
                    CustomInput(
                      controller: _passwordController,
                      prefixIcon: Icons.key,
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
                        const Text("Don't have an account?",
                            style: TextStyle(color: Colors.white30)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RouteNames.signUp);
                            },
                            child: const CustomText(text: "Sign Up")),
                      ],
                    ),
                    CustomButton(
                      text: "Sign In",
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.home);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
