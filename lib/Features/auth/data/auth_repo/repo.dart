import 'package:hungry_resturant/Features/auth/data/user_model.dart';
import 'package:hungry_resturant/core/network/api_service.dart';
import 'package:hungry_resturant/core/units/pref_helper.dart';

class AuthRepo {
  final ApiService apiService = ApiService();
  UserModel? _currentUser;
  bool isGuest = true;

  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => !isGuest && _currentUser != null;





  //! Login
  Future<UserModel?> login(String email, String password) async {
    final response = await apiService.post(
      '/login',
      {
        'email': email,
        'password': password,
      },
    );
    final user = UserModel.fromJson(response['data']);
    if (user.token != null) await PrefHelper.saveToken(user.token!);
    _currentUser = user;
    isGuest = false;
    return user;
  }






  //! Signup
  Future<UserModel?> signup(String name, String email, String password) async {
    final response = await apiService.post(
      '/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    final user = UserModel.fromJson(response['data']);
    if (user.token != null) await PrefHelper.saveToken(user.token!);
    _currentUser = user;
    isGuest = false;
    return user;
  }





  //! Get profile
  Future<UserModel?> getProfile() async {
    final token = await PrefHelper.getToken();
    if (token == null) return null;
    final response = await apiService.get('/profile', auth: true);
    final user = UserModel.fromJson(response['data']);
    _currentUser = user;
    isGuest = false;
    return user;
  }




  //! Auto login
  Future<UserModel?> autoLogin() async {
    final token = await PrefHelper.getToken();
    if (token == null) {
      isGuest = true;
      return null;
    }
    return await getProfile();
  }




  //! Update Profile 
  Future<UserModel?> updateProfile({
    String? name,
    String? email,
  }) async {
    try {
      final response = await apiService.post(
        '/update-profile',
        {
          if (name != null) 'name': name,
          if (email != null) 'email': email,
        },
        auth: true,
      );
      final user = UserModel.fromJson(response['data']);
      _currentUser = user;
      isGuest = false;
      return user;
    } catch (e) {
      return null;
    }
  }




  //! Logout
Future<void> logout() async {
  try {
    // إرسال طلب logout للـ API
    await apiService.post('/logout', {}, auth: true);

    // مسح التوكن من التخزين المحلي
    await PrefHelper.clearToken();

    // إعادة الحالة للمستخدم الضيف
    _currentUser = null;
    isGuest = true;
  } catch (e) {
    // ممكن تتعامل مع الخطأ هنا أو تكتفي بتسجيله
    print('Logout failed: $e');
  }
}
}
