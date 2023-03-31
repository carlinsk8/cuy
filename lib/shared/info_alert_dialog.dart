import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class InfoAlertDialog extends StatelessWidget {
  const InfoAlertDialog({super.key, 
    this.title,
    this.image,
    required this.message,
    this.onConfirm,
  });
  final String? title;
  final Widget? image;
  final String message;
  final Function? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical : 10.0),
              color: Colors.transparent,
              child: Column(
                children: _buildContentDialog(context),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 60.0,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -15.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: _buildBottomDialog(context)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContentDialog(BuildContext context) {
    final widgets = <Widget>[];
    
    if (image != null) {
      widgets.add(
        SizedBox(
          height: 80.0,
          width: 78.0,
          child: image,
        ),
      );
      widgets.add(const SizedBox(height: 15));
    }
    

    if (title != null) {
      widgets.add(
        Text(title!,
            textAlign: TextAlign.center,
            style:TextStyle(color: Theme.of(context).primaryColorDark)),
      );

      widgets.add(const SizedBox(height: 15));
    }

    widgets.add(
      Text(
        message,
        textAlign: TextAlign.center,
        style:TextStyle(color: Theme.of(context).primaryColor),
      ),
    );

    return widgets;
  }

  Widget _buildBottomDialog(BuildContext context) {
    final actions = <Widget>[];

    

    actions.add(
      Flexible(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: const Size.fromHeight(52),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
          onPressed: (){
            if (onConfirm != null) onConfirm!();
          },
          child: Text(
            S.of(context).ok,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ),
    );

    return Container(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
      ),
      child: Row(
        mainAxisAlignment: actions.length > 1
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: actions,
      ),
    );
  }
}
