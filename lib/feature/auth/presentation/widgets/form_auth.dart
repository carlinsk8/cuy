import 'package:cuy_test/feature/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/validator.dart';
import '../../../../generated/l10n.dart';
import '../../../../shared/app_images.dart';
import '../../../../shared/info_alert_dialog.dart';
import '../../../../shared/view_state.dart';
import '../../../../../../di/injection_container.dart' as di;
import '../../../plans/presentation/pages/plnas_page.dart';

class FormAuth extends StatefulWidget {
  const FormAuth({
    super.key,
  });

  @override
  State<FormAuth> createState() => _FormAuthState();
}

class _FormAuthState extends State<FormAuth> {
  final _formKey = GlobalKey<FormState>();
  final validator = di.sl<Validator>();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  String email ='';
  String password='';

  void process() {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    final currentState = provider.state;
    
    if (currentState is Error) {
      showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return InfoAlertDialog(
          image: Icon(Icons.warning_amber_rounded, color: Theme.of(context).primaryColor, size: 50),
          message: S.of(context).unexpectedErrorMessage,
          onConfirm: () => Navigator.pop(context) 
        );
      });
    } else if (currentState is Loaded<bool?>) {
      PlansPage.pushNavigate(context,replace: true);
    }
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final currentState = provider.state;

    return ModalProgressHUD(
      inAsyncCall: currentState is Loading,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              _logo(),
              const SizedBox(height: 40),
              _buildEmailTextField(context),
              const SizedBox(height: 20),
              _buildPasswordTextField(context),
              const SizedBox(height: 20),
              _buildSendBottom(context)
            ],
          ),
        )
      ),
    );
  }

  TextFormField _buildEmailTextField(BuildContext context) {
    return TextFormField(
      focusNode: _emailFocus,
      onChanged: (value) => email = value.trim(),
      onSaved: (value) {
        email = value?.trim() ?? "";
        _emailFocus.unfocus();
      },
      validator: (value){
        final val = value?.trim() ?? "";
        if (!validator.isEmail(val)) {
          return S.of(context).invaliEmailMessage;
        }
        return null;
        
      },
      decoration: InputDecoration(
        hintText: S.of(context).email,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  TextFormField _buildPasswordTextField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      focusNode: _passwordFocus,
      onChanged: (value) => password = value.trim(),
      onSaved: (value) {
        password = value?.trim() ?? "";
        _passwordFocus.unfocus();
      },
      validator: (value){
        final val = value?.trim() ?? "";
        if (validator.isRequired(val)) {
          return S.of(context).requiredField;
        }
        return null;
        
      },
      decoration: InputDecoration(
        hintText: S.of(context).password,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _logo() {
    return Center(
      child: Image.asset(
        AppImagePaths.logo,
        width: 150,
      ),
    );
  }

  Widget _buildSendBottom(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primary,
        minimumSize: const Size.fromHeight(52),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
      onPressed: () async {
        if (_formKey.currentState?.validate() ?? false) {
          _formKey.currentState!.save();
          final provider = Provider.of<AuthProvider>(context,listen: false);
          await provider.login(email, password);
          process();
        }
      },
      child: Text(
        S.of(context).send,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

