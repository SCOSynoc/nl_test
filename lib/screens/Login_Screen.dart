import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neru_test_app/AuthBloc/auth_events.dart';
import 'package:neru_test_app/widgets/Loading_manager.dart';


import '../AuthBloc/auth_bloc.dart';
import '../AuthBloc/auth_states.dart';
import '../widgets/build_button.dart';
import '../widgets/build_text_feild.dart';
import 'dashboard_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    bool loading = false;
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (BuildContext context,  state) {
        if(state is AuthLoading) {
           loading = true;
        }
        if(state is AuthSuccess) {
          loading = false;
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  DashboardScreen()));
        }
      },
      builder: (context, state) {
        return LoadingManager(
          isLoading: loading,
          child: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: SizedBox(
                    width:MediaQuery.of(context).size.width > 800 ? 400: MediaQuery.of(context).size.width*0.65,
                    height: MediaQuery.of(context).size.height*0.55,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Placeholder for Isometric Graphics
                          BuildTextField(
                            hintText: 'Email',
                            obscureText: false, controller: email,
                          ),
                          SizedBox(height: 20),
                          BuildTextField(
                            hintText: 'Password',
                            controller: password,
                            obscureText: true,
                          ),
                          SizedBox(height: 20),
                          BuildButton(
                            text: 'Log in',
                            color: Colors.blue,
                            onPressed: () {
                              print("In frontend ${email.text} and ${password.text}");
                              context.read<AuthBloc>().add(AuthLoginRequested(email: email.text, password: password.text));
                            },
                          ),
                          SizedBox(height: 20),
                          const Text(
                            'Do Not Have An Account?',
                            style: TextStyle(color: Colors.black54),
                          ),
                          SizedBox(height: 10),
                          BuildButton(
                            text: 'Create A New Account',
                            color: Colors.green,
                            onPressed: () {},
                          ),
                          SizedBox(height: 20),
                          const Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.black54),
                          ),
                          SizedBox(height: 10,),
                          BuildButton(
                            text: 'Reset Password',
                            color: Colors.green,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

