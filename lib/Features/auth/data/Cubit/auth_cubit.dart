import 'package:bloc/bloc.dart';
import 'package:hungry_resturant/Features/auth/data/auth_repo/repo.dart';
import 'package:hungry_resturant/core/network/api_error.dart';
import 'package:hungry_resturant/core/units/pref_helper.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  //! Login
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.login(email, password);

      if (user?.token != null) {
        await PrefHelper.saveToken(user!.token!);
      }

      emit(AuthSuccess(user!));
    } on ApiError catch (e) {
      emit(AuthFailure(e.message));
    } catch (_) {
      emit(const AuthFailure("Something went wrong"));
    }
  }

  //! Signup
  Future<void> signup(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.signup(name, email, password);

      if (user?.token != null) {
        await PrefHelper.saveToken(user!.token!);
      }

      emit(AuthSuccess(user!));
    } on ApiError catch (e) {
      emit(AuthFailure(e.message));
    } catch (_) {
      emit(const AuthFailure("Something went wrong"));
    }
  }

  //! Auto Login
  Future<void> autoLogin() async {
    emit(AuthLoading());
    try {
      final user = await authRepo.autoLogin();

      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthInitial()); // Guest
      }
    } on ApiError catch (e) {
      emit(AuthFailure(e.message));
    } catch (_) {
      emit(const AuthFailure("Something went wrong"));
    }
  }

  //! Logout (اختياري بس مهم)
  Future<void> logout() async {
    await PrefHelper.clearToken();
    emit(AuthInitial());
  }
}