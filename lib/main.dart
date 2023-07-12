import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_kino/services/auth_service.dart';

import 'feature/register/ui/register_screen.dart';
import 'global/app_cubit/app_cubit.dart';
import 'global/auth/auth_cubit.dart';
import 'global/data/auth_repository.dart';
import 'global/theme_bloc/theme_cubit.dart';

void main() {
  runApp(MyRepositoryProviders());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocate(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _locale,
              title: 'Flutter Demo',
              theme: state.themeData,
              home: const MyHomePage());
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const RegisterScreen();
  }
}

class MyRepositoryProviders extends StatelessWidget {
  MyRepositoryProviders({super.key});

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
          create: (_) => AuthRepository(authService: authService),)
    ], child: const MyBlocProviders());
  }
}

class MyBlocProviders extends StatelessWidget {
  const MyBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) =>
          AppCubit(
              authRepository: RepositoryProvider.of<AuthRepository>(context)),
        lazy: false,),
      BlocProvider(create: (_) =>
          AuthCubit(
              authRepository: RepositoryProvider.of<AuthRepository>(context)),
        lazy: false,),
    ], child: const MyApp());
  }
}

