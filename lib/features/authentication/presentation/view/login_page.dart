import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/authentication/domain/domain.dart';
import 'package:simple_commerce/features/authentication/presentation/presentation.dart';
import 'package:simple_commerce/features/cart/presentation/presentation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _authBloc = di<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Simple Commerce',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  label: Text('Username'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field can not be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  label: Text('Password'),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field can not be empty';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              BlocProvider(
                create: (context) => _authBloc,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoginSuccess) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()),
                          (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.loginResponse.token ?? ''),
                        ),
                      );
                    } else if (state is AuthLoadFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.errorMessage),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (state is! AuthLoadInProgress) {
                          if (_formKey.currentState!.validate()) {
                            _authBloc.add(
                              AuthLoginPressed(
                                params: ParamsLogin(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: (state is AuthLoadInProgress)
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Text('Login'),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
