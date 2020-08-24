import 'package:shared_preferences/shared_preferences.dart';
import '../localization/app_localization.dart';

class PreferencesService {
  final _lang = 'lang';

  get lang async => (await _get(_lang)) ?? AppLocalization.tr;

  set lang(String value) => _put(_lang, value);

  _put(String key, String value) {
    SharedPreferences.getInstance()
        .then((instance) => instance.setString(key, value));
  }

  Future<String> _get(String key) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }
}
