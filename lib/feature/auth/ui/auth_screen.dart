import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:info_kino/main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("asdf"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.goobBye),
            TextButton(
                onPressed: () {
                  MyApp.setLocate(context, Locale('ru'));
                },
                child: Text('ru')),
            TextButton(
                onPressed: () {
                  MyApp.setLocate(context, Locale('en'));
                },
                child: Text('en'))
          ],
        ),
      ),
    );
  }
}
