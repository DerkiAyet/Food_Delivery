import 'package:flutter/material.dart';
import 'package:tp/components/my_button.dart';
import 'package:tp/components/my_textField.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController pwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            SizedBox(height: 25,),

            Text(
              "Food Delivery App",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),

            const SizedBox(height: 25,),

            MyTextfield(
              controller: emailController,
              hintText: "email",
              obscureText: false,
            ),

            const SizedBox(height: 10,),

            MyTextfield(
              controller: pwdController,
              hintText: "password",
              obscureText: true,
            ),

            const SizedBox(height: 10,),

            MyTextfield(
              controller: confirmPwdController,
              hintText: "Confirm Password",
              obscureText: true,
            ),

            const SizedBox(height: 10,),

            MyButton(
                onTap: () {},
                text: "Sign Up"
            ),

            const SizedBox(height: 25,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login Here",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
