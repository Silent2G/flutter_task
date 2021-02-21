import 'package:flutter/material.dart';

extension ValidatorExtension on Widget {
  FormFieldValidator<String> get passwordValidator {
    return (String value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      } else if (value.length < 4) {
        return 'Password too short';
      } else if (value.length > 8) {
        return 'Password too long';
      } else if (value.contains(' ')) {
        return 'Password must be without spaces';
      } else if (value.contains('#')) {
        return 'Password must not contain # symbol';
      } else if (value.contains('№')) {
        return 'Password must not contain № symbol';
      }
      return null;
    };
  }

  FormFieldValidator<String> get loginValidator {
    return (String value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      } else if (value.length < 4) {
        return 'Login too short';
      } else if (value.length > 8) {
        return 'Login too long';
      } else if (value.contains(' ')) {
        return 'Login must be without spaces';
      }
      return null;
    };
  }
}
