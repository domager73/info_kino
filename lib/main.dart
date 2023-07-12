import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:info_kino/global/app_cubit/app_cubit.dart';
import 'package:info_kino/global/auth/auth_cubit.dart';
import 'package:info_kino/global/data/auth_repository.dart';
import 'package:info_kino/global/theme_bloc/theme_cubit.dart';
import 'package:info_kino/services/auth_service.dart';
import 'package:info_kino/themes/themes.dart';

void main() {
  runApp(MyRepositoryProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale('en'),
              title: 'Flutter Demo',
              theme: state.themeData,
              home: MyHomePage());
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.goobBye),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context)
                      .changeThem(AppThemesEnum.light);
                },
                child: const Icon(Icons.sunny)),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context)
                      .changeThem(AppThemesEnum.dark);
                },
                child: const Icon(Icons.nights_stay)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyRepositoryProviders extends StatelessWidget {
  MyRepositoryProviders({super.key});

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
        create: (_) => AuthRepository(authService: authService)..checkLogin(),
        lazy: false,
      )
    ], child: const MyBlocProviders());
  }
}

class MyBlocProviders extends StatelessWidget {
  const MyBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => AppCubit(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => AuthCubit(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        lazy: false,
      ),
    ], child: const MyApp());
  }
}
