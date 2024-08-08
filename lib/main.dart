import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_ease/home/dashboard/cubit/dashboard_cubit.dart';
import 'package:home_ease/home/dashboard/ui/screens/dashboard_screen.dart';
import 'package:home_ease/theme/theme.dart';
import 'package:home_ease/home/update_room_settings/cubit/update_room_settings_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DashboardCubit()),
        BlocProvider(create: (context) => UpdateRoomSettingsCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: SHTheme.dark,
        home: const DashboardScreen(),
      ),
    );
  }
}
