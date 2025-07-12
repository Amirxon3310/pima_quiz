import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/features/auth/data/datasource/auth_datasource_impl.dart';
import 'package:pima_quiz/features/auth/data/repository/auth_repository_impl.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/pages/splash_screen.dart';
import 'package:pima_quiz/features/profile/data/datasource/profile_datasource_impl.dart';
import 'package:pima_quiz/features/profile/data/repository/profile_respository_impl.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:pima_quiz/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Main: ${FirebaseAuth.instance.currentUser?.uid}");
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                repository: AuthRepositoryImpl(
                  AuthDataSourceImpl(
                    firebaseAuth: FirebaseAuth.instance,
                    firestore: FirebaseFirestore.instance,
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => ProfileBloc(
                repository: ProfileRespositoryImpl(
                  dataSource: ProfileDatasourceImpl(
                      firestore: FirebaseFirestore.instance),
                ),
              ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(), // Splash screen ga o'zgartirishim kerak!
            builder: (context, widget) {
              ScreenUtil.init(context);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
          ),
        );
      },
    );
  }
}
