import 'package:bytebank_dashborad/components/theme.dart';
import 'package:bytebank_dashborad/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ByteBankApp());
}

class LogObserver extends BlocObserver {

  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} > $change');
    super.onChange(cubit, change);
  }
}

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Bloc.observer = LogObserver();

    return MaterialApp(
      theme: bytebankTheme,
      home: DashboardContainer(),
    );
  }
}


