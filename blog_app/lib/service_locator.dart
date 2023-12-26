import 'package:blog_app/modules/auth/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:blog_app/modules/auth/data/data_sources/remote/authentication_remote_data_source_impl.dart';
import 'package:blog_app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:blog_app/modules/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:blog_app/modules/auth/presentations/bloc/auth_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setUp() async {
  // ? remote and local data sources
  sl.registerSingleton<AuthenticationRemoteDataSource>(
      AuthenticationRemoteDataSourceImpl());

  //? repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(
      authenticationRemoteDataSource:
          sl.call<AuthenticationRemoteDataSource>()));

  //usecases
  sl.registerSingleton<GoogleSignInUseCase>(
    GoogleSignInUseCase(
      authRepository: sl.call<AuthRepository>(),
    ),
  );

  //cubits

  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      googleSignInUseCase: sl.call<GoogleSignInUseCase>(),
    ),
  );
}
