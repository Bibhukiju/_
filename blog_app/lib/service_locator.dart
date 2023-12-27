import 'package:blog_app/modules/auth/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:blog_app/modules/auth/data/data_sources/remote/authentication_remote_data_source_impl.dart';
import 'package:blog_app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:blog_app/modules/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:blog_app/modules/auth/presentations/bloc/auth_cubit.dart';
import 'package:blog_app/modules/blogs/data/data_sources/remote/blog_remote_data_source.dart';
import 'package:blog_app/modules/blogs/data/data_sources/remote/blog_remote_data_source_impl.dart';
import 'package:blog_app/modules/blogs/data/repositories/blog_repositories_impl.dart';
import 'package:blog_app/modules/blogs/domain/repository/blog_repository.dart';
import 'package:blog_app/modules/blogs/domain/usecases/get_all_blogs_usecase.dart';
import 'package:blog_app/modules/blogs/presentation/cubit/blog_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setUp() async {
  // ? remote and local data sources
  sl.registerSingleton<AuthenticationRemoteDataSource>(
      AuthenticationRemoteDataSourceImpl());

  // ? for blogs
  sl.registerSingleton<BlogRemoteDataSource>(BlogRemoteDataSourceImpl());

  //? repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(
      authenticationRemoteDataSource:
          sl.call<AuthenticationRemoteDataSource>()));

  // ? for blogs
  sl.registerSingleton<BlogRepository>(BlogRepositoryImpl(
      blogRemoteDataSource: sl.call<BlogRemoteDataSource>()));

  //usecases
  sl.registerSingleton<GoogleSignInUseCase>(
    GoogleSignInUseCase(
      authRepository: sl.call<AuthRepository>(),
    ),
  );

  // ? usecases for blogs

  sl.registerSingleton<GetAllBlogsUseCase>(
      GetAllBlogsUseCase(blogRepository: sl.call<BlogRepository>()));

  //cubits

  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      googleSignInUseCase: sl.call<GoogleSignInUseCase>(),
    ),
  );

  // ? blogs
  sl.registerFactory(
      () => BlogCubit(getAllBlogsUseCase: sl.call<GetAllBlogsUseCase>()));
}
