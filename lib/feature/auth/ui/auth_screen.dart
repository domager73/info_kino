import 'package:flutter/material.dart';
import 'package:info_kino/utils/fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.auth),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(height: 50,),
                  Text(AppLocalizations.of(context)!.email),
                  TextFormField(
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(AppLocalizations.of(context)!.password),
                  TextFormField(
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.auth, style: AppTypography.font16black,),
                    ),
                  ),
                  const SizedBox(height: 50,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// Text(AppLocalizations.of(context)!.goobBye),
// TextButton(
// onPressed: () {
// MyApp.setLocate(context, Locale('ru'));
// },
// child: Text('ru')),
// TextButton(
// onPressed: () {
// MyApp.setLocate(context, Locale('en'));
// },
// child: Text('en'))
