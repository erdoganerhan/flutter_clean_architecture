import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import './simple_bloc_observer.dart';
import 'app.dart';
import 'src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: SimpleBlocObserver(),
  );
}
