enum PasswordStrength {
  weak,
  medium,
  strong,
}

class ValidationHelper {
  ValidationHelper._();

  static final RegExp _upperCaseRegex = RegExp(r'[A-Z]');
  static final RegExp _lowerCaseRegex = RegExp(r'[a-z]');
  static final RegExp _numberRegex = RegExp(r'[0-9]');
  static final RegExp _specialRegex = RegExp(
    r'[!@#$%^&*(),.?":{}|<>]',
  );
  static final RegExp _emailRegex = RegExp(
    r'^[\w\.-]+@[\w\.-]+\.\w+$',
  );
  static final RegExp _nameRegex = RegExp(
    r'^[a-zA-Z\s]+$',
  );
  static final RegExp _egyptPhoneRegex = RegExp(
    r'^(010|011|012|015)[0-9]{8}$',
  );
  static final RegExp _nationalIdRegex = RegExp(
    r'^\d{14}$',
  );

  static bool hasMinLength(String password) {
    return password.length >= 8;
  }

  static bool hasUpperCase(String password) {
    return _upperCaseRegex.hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return _lowerCaseRegex.hasMatch(password);
  }

  static bool hasNumber(String password) {
    return _numberRegex.hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return _specialRegex.hasMatch(password);
  }

  static bool isValidPassword(String password) {
    return hasMinLength(password) &&
        hasUpperCase(password) &&
        hasLowerCase(password) &&
        hasNumber(password) &&
        hasSpecialCharacter(password);
  }

  static PasswordStrength getPasswordStrength(
    String password,
  ) {
    int score = 0;

    if (hasMinLength(password)) score++;
    if (hasUpperCase(password)) score++;
    if (hasLowerCase(password)) score++;
    if (hasNumber(password)) score++;
    if (hasSpecialCharacter(password)) score++;

    if (score <= 2) {
      return PasswordStrength.weak;
    }

    if (score <= 4) {
      return PasswordStrength.medium;
    }

    return PasswordStrength.strong;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email format';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (!hasMinLength(value)) {
      return 'Password must be at least 8 characters';
    }

    if (!hasUpperCase(value)) {
      return 'Password must contain at least 1 uppercase letter';
    }

    if (!hasLowerCase(value)) {
      return 'Password must contain at least 1 lowercase letter';
    }

    if (!hasNumber(value)) {
      return 'Password must contain at least 1 number';
    }

    if (!hasSpecialCharacter(value)) {
      return 'Password must contain at least 1 special character';
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String? original,
  ) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }

    if (value != original) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    if (!_nameRegex.hasMatch(value.trim())) {
      return 'Name must contain letters only';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final phone = value.replaceAll(' ', '');

    if (!phone.startsWith('01')) {
      return 'Phone number must start with "01"';
    }

    if (phone.length != 11) {
      return 'Phone number must be exactly 11 digits';
    }

    if (!_egyptPhoneRegex.hasMatch(phone)) {
      return 'Invalid Egyptian phone number format';
    }

    return null;
  }

  static String? validateNotEmpty(
    String? value, {
    String? fieldName,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? "This field"} is required';
    }

    return null;
  }

  static String? validateNumber(
    String? value, {
    String? fieldName,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? "Number"} is required';
    }

    if (double.tryParse(value.trim()) == null) {
      return '${fieldName ?? "Value"} must be a valid number';
    }

    return null;
  }

  static String? validateNationalID(String? value) {
    if (value == null || value.isEmpty) {
      return 'National ID is required';
    }

    if (value.length != 14) {
      return 'National ID must be exactly 14 digits';
    }

    if (!_nationalIdRegex.hasMatch(value)) {
      return 'National ID must contain digits only';
    }

    if (!value.startsWith('2') && !value.startsWith('3')) {
      return 'National ID must start with 2 or 3';
    }

    return null;
  }
}