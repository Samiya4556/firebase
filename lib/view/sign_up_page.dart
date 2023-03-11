import 'package:bakcends/provider/sign_up_provider.dart';
import 'package:bakcends/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Sign Up"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: context.watch<SignUpProvider>().emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  controller:
                      context.watch<SignUpProvider>().passwordlController,
                  decoration: const InputDecoration(hintText: "Password"),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(onPressed: () async {
              await context
                  .read<SignUpProvider>()
                  .signUp()
                  .then((dynamic response) {
                if (response is bool) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              });
            },child: Provider.of<SignUpProvider>(context,listen:false).isLoading? const Center(
              child: CircularProgressIndicator(),
            ):const Text("Sign Up")));
      },
    );
  }
}
