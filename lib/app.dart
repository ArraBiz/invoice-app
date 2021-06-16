import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/application/store_notifier.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/providers.dart';

import 'core/theme.dart';
import 'screens/onboarding.dart';

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
  @override
  void initState() {
    super.initState();
    context.read(storeNotifierProvider.notifier).getStore();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: storeNotifierProvider,
      onChange: (context, state) {
        if (state is StoreError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Consumer(
        builder: (context, watch, child) {
          final state = watch(storeNotifierProvider);
          if (state is StoreInitial || state is StoreLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is StoreLoaded) {
            return Onboarding();
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Image(
                        image: AssetImage(
                          './assets/illustration/db-error.png',
                        ),
                        height: MySize.safeWidth! * 0.5,
                        width: MySize.safeWidth! * 0.5),
                  ),
                  Container(
                    child: Text("Error establishing a database connection"),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
