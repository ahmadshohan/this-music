import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_music/shared/model/user_gender.dart';
import '../localization/app_localization.dart';

class PreferencesService {
  final _lang = 'lang';
  final _userGender = UserGender.Male;
  final _token = 'token';
  final _user = 'user';

  get lang async => (await _get(_lang)) ?? AppLocalization.tr;

  set lang(String value) => _put(_lang, value);

  get token async => (await _get(_token));

  set token(String value) => _put(_token, value);

  get user async => (await _get(_user));

  set user(String value) => _put(_user, value);

  _put(String key, String value) {
    SharedPreferences.getInstance()
        .then((instance) => instance.setString(key, value));
  }

  Future<String> _get(String key) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }
}
