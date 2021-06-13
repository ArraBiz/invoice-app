import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/providers.dart';
import 'package:invoice/repositories/database_repository.dart';
import 'package:objectbox/objectbox.dart';

import 'core/theme.dart';
import 'screens/Onboarding.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        home: Root(),
      ),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  late Store _store;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    DatabaseRepository().fetchStore().then((store) {
      setState(() {
        _store = store;
        _loading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    context.read(storeProvider).state?.close();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseRepository().fetchStore(),
        builder: (context, AsyncSnapshot<Store> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              context.read(storeProvider).state = snapshot.data!;
              return Onboarding();
            }
          }

          return Scaffold(body: Center(child: CircularProgressIndicator()));
        });
  }
}
