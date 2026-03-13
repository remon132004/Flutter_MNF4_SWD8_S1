import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/core/constants/app_strings.dart';
import 'package:notes/core/routing/app_router.dart';
import 'package:notes/features/note/data/models/note_model.dart';
import 'package:notes/features/note/data/repo/NotesRepo.dart';
import 'package:notes/features/note/presentation/cubit/notes_cubit/notes_cubit.dart';
import 'features/note/presentation/cubit/ThemeCubit/theme_cubit.dart';
import 'features/note/presentation/screens/note_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(AppStrings.notesBox);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotesCubit(NotesRepo())..getNotes()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Poppins',
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins',
          ),
          themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          home: const HomeScreen(),
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}