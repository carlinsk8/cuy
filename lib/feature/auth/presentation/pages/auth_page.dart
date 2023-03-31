import 'package:flutter/material.dart';

import '../widgets/form_auth.dart';


class AuthPage extends StatelessWidget {

  static const id = 'auth_page';

  static Future<T?> pushNavigate<T extends Object?>(
    BuildContext context, {
    bool replace = false,
  }) {
    return replace
        ? Navigator.pushNamedAndRemoveUntil(
            context,
            id,
            (route) => false,
          )
        : Navigator.pushNamed(context, id);
  }

  const AuthPage({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FormAuth(),
   );
  }
}

