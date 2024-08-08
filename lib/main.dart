import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/home/cubit/home_cubit.dart';
import 'package:home_ease/home/ui/screens/home_screen.dart';
import 'package:home_ease/theme/theme.dart';
import 'package:home_ease/update_room_settings/cubit/update_room_settings_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => UpdateRoomSettingsCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: SHTheme.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
