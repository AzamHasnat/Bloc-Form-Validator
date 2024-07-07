import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_state.dart';
import 'package:bloc_form_validation/screens/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign In',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
          bottomOpacity: 1.0,
          toolbarHeight: 40.0,
          toolbarOpacity: 1.0,
          shape: const Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangdEvent(emailController.text.trim(),
                          passwordController.text.trim()));
                },
                decoration: InputDecoration(
                  labelText: 'Email Address',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangdEvent(emailController.text.trim(),
                          passwordController.text.trim()));
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(child: CircularProgressIndicator());
                    
                  }
                  return CupertinoButton(
                      color: (state is SignInValidState)
                          ? Colors.blue
                          : Colors.grey.shade400,
                      child: const Text('Sign In'),
                      onPressed: () {
                        if (state is SignInValidState) {
                          BlocProvider.of<SignInBloc>(context).add(
                              SignInSubmittedEvent(emailController.text.trim(),
                                  passwordController.text.trim()));
                        }
                      });
                },
              )
            ],
          ),
        )));
  }
}
