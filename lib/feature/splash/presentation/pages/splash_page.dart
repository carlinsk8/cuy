import 'package:cuy_test/feature/plans/presentation/pages/plnas_page.dart';
import 'package:cuy_test/shared/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';
import '../../../../shared/info_alert_dialog.dart';
import '../../../../shared/view_state.dart';
import '../../../auth/presentation/pages/auth_page.dart';
import '../provider/splash_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  SplashProvider? provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      provider = Provider.of<SplashProvider>(context, listen: false);
      await provider?.getToken();
      await Future.delayed(const Duration(seconds: 1));
      process();
    });
    super.initState();
  }

  void process() {
    final provider = Provider.of<SplashProvider>(context, listen: false);
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
    } else if (currentState is Loaded<String?>) {
      if(currentState.value == ''){
        AuthPage.pushNavigate(context,replace: true);
      }else{
        PlansPage.pushNavigate(context,replace: true);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox.shrink(),
          Center(
            child: Image.asset(
              AppImagePaths.logo,
              width: 180,
            ),
          ),
          const CircularProgressIndicator()
        ],
      ),
   );
  }
}