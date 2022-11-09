import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockemon_cubit/bloc/home/home_bloc.dart';
import 'package:pockemon_cubit/provider_setup.dart';
import 'package:pockemon_cubit/widgets/home/home_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocProvider(
              create: (context) =>
                  HomeBloc(Provider.of(context, listen: false), Provider.of(context, listen: false)),
              child: const HomeWidget()),
        ));
  }
}
