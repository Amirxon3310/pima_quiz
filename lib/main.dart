import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pima_quiz/core/data/local_datasource.dart';
import 'package:pima_quiz/features/auth/data/datasource/auth_datasource_impl.dart';
import 'package:pima_quiz/features/auth/data/repository/auth_repository_impl.dart';
import 'package:pima_quiz/features/auth/data/repository/otp_repository.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/pages/splash_screen.dart';
import 'package:pima_quiz/features/home/data/datasources/banners_remote_datasource.dart';
import 'package:pima_quiz/features/home/data/datasources/categories_remote_datasource.dart';
import 'package:pima_quiz/features/home/data/datasources/news_remote_datasource.dart';
import 'package:pima_quiz/features/home/data/datasources/questions_remote_datasource.dart';
import 'package:pima_quiz/features/home/data/datasources/quiz_remote_datasource.dart';
import 'package:pima_quiz/features/home/data/datasources/users_remote_datasource.dart';
import 'package:pima_quiz/features/home/data/repositories/banners_repository_impl.dart';
import 'package:pima_quiz/features/home/data/repositories/categories_repository_impl.dart';
import 'package:pima_quiz/features/home/data/repositories/news_repository_impl.dart';
import 'package:pima_quiz/features/home/data/repositories/questions_repository_impl.dart';
import 'package:pima_quiz/features/home/data/repositories/users_repository_impl.dart';
import 'package:pima_quiz/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:pima_quiz/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:pima_quiz/features/home/domain/usecases/get_news_usecase.dart';
import 'package:pima_quiz/features/home/domain/usecases/get_users_usecase.dart';
import 'package:pima_quiz/features/home/presentation/blocs/banners_bloc/banners_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/banners_bloc/banners_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/questions_bloc/questions_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_bloc.dart';
import 'package:pima_quiz/features/profile/data/datasource/profile_datasource_impl.dart';
import 'package:pima_quiz/features/profile/data/repository/profile_respository_impl.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_event.dart';
import 'package:pima_quiz/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  await Hive.initFlutter();
  await HiveController.instance.init();
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
              create: (context) => QuizBloc(
                QuizRemoteDatasourceImpl(
                    FirebaseFirestore.instance, FirebaseAuth.instance),
              ),
            ),
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
                    firebaseAuth: FirebaseAuth.instance,
                    firestore: FirebaseFirestore.instance,
                  ),
                ),
              )..add(GetUserByIdEvent()),
            ),
            BlocProvider(
              create: (_) => BannersBloc(
                GetBannersUseCase(
                  BannersRepositoryImpl(
                    BannersRemoteDatasourceImpl(FirebaseFirestore.instance),
                  ),
                ),
              )..add(LoadBannersEvent()),
            ),
            BlocProvider(
              create: (_) => NewsBloc(
                GetNewsUseCase(
                  NewsRepositoryImpl(
                    NewsRemoteDatasourceImpl(FirebaseFirestore.instance),
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (_) => CategoryBloc(
                GetCategoriesUsecase(
                  CategoriesRepositoryImpl(
                    CategoriesRemoteDatasourceImpl(FirebaseFirestore.instance),
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (_) => UsersBloc(
                GetUsersUsecase(
                  UsersRepositoryImpl(
                    UsersRemoteDatasourceImpl(FirebaseFirestore.instance),
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (_) => QuestionsBloc(
                QuestionsRepositoryImpl(
                  QuestionsRemoteDatasourceImpl(FirebaseFirestore.instance),
                ),
              ),
            ),
            BlocProvider(
              create: (_) => OtpBloc(OtpRepository()),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(), // Splash screenni joyiga qo'yishim kerak.
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
