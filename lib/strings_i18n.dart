library strings_i18n;

import 'dart:io';
import 'dart:convert';
import 'package:sprintf/sprintf.dart';

Map<String, String> errors;
Map<String, String> textMessages;

Future<Null> _unused1 = new File('../lang/fr/errors.json').readAsString()
.then((fileContents) => json.decode(fileContents))
.then((jsonData) {
    errors = jsonData;
});

Future<Null> _unused2 = new File('../lang/fr/textmessages.json').readAsString()
.then((fileContents) => json.decode(fileContents))
.then((jsonData) {
    errors = jsonData;
});

/// A Calculator.
class StringsI18N {
  static String error(String code, [List<String> params]) {
    String val = errors[code];
    if (val != null) {
      return sprintf(val, params);
    }
    return "?$code";
  }

  static String message(String code, List<String> params) {
    String val = textMessages[code];
    if (val != null) {
      return sprintf(val, params);
    }
    return "?$code";
  }
}
