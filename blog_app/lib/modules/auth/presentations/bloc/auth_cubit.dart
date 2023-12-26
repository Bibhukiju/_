import 'package:bloc/bloc.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/modules/auth/data/models/auth_model.dart';
import 'package:blog_app/modules/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:equatable/equatable.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GoogleSignInUseCase googleSignInUseCase;
  AuthCubit({
    required this.googleSignInUseCase,
  }) : super(InitState());

  Future<void> signIn() async {
    final loggedIn = await googleSignInUseCase.call();
    loggedIn.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureState(l.failureMessage));
        } else if (l is GenericFailure) {
          emit(FailureState(l.failureMessage));
        }
      },
      (r) => emit(LoggedInState(r)),
    );
  }
}
