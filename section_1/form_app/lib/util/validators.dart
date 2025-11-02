class Validators {
  // Email validation
  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }
  
  // Bangladesh phone number validation
  static String? bangladeshNumberValidator(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone number is required';
    }
    
    // Remove all non-digit characters
    String cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');
    
    // Check if it starts with country code
    if (cleanPhone.startsWith('880')) {
      cleanPhone = cleanPhone.substring(3);
    } else if (cleanPhone.startsWith('0')) {
      cleanPhone = cleanPhone.substring(1);
    }
    
    // Bangladesh mobile numbers are 11 digits
    if (cleanPhone.length != 11) {
      return 'Phone number must be 11 digits';
    }
    
    // Check if it starts with valid prefixes
    List<String> validPrefixes = ['013', '014', '015', '016', '017', '018', '019'];
    String prefix = cleanPhone.substring(0, 3);
    
    if (!validPrefixes.contains(prefix)) {
      return 'Please enter a valid Bangladesh mobile number';
    }
    
    return null;
  }
  
  // Password validation
  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    
    return null;
  }
  
  // Confirm password validation
  static String? confirmPasswordValidator(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    
    return null;
  }
  
  // Name validation
  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    
    if (name.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      return 'Name can only contain letters and spaces';
    }
    
    return null;
  }
  
  // Age validation
  static String? ageValidator(String? age) {
    if (age == null || age.isEmpty) {
      return 'Age is required';
    }
    
    int? ageValue = int.tryParse(age);
    if (ageValue == null) {
      return 'Please enter a valid age';
    }
    
    if (ageValue < 13) {
      return 'You must be at least 13 years old';
    }
    
    if (ageValue > 120) {
      return 'Please enter a valid age';
    }
    
    return null;
  }
  
  // NID (National ID) validation for Bangladesh
  static String? nidValidator(String? nid) {
    if (nid == null || nid.isEmpty) {
      return 'NID is required';
    }
    
    // Remove all non-digit characters
    String cleanNid = nid.replaceAll(RegExp(r'[^\d]'), '');
    
    // Bangladesh NID is 10 or 13 digits
    if (cleanNid.length != 10 && cleanNid.length != 13) {
      return 'NID must be 10 or 13 digits';
    }
    
    return null;
  }
  
  // Required field validation
  static String? requiredValidator(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
  
  // Minimum length validation
  static String? minLengthValidator(String? value, int minLength, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters long';
    }
    
    return null;
  }
  
  // Maximum length validation
  static String? maxLengthValidator(String? value, int maxLength, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (value.length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }
    
    return null;
  }
  
  // URL validation
  static String? urlValidator(String? url) {
    if (url == null || url.isEmpty) {
      return 'URL is required';
    }
    
    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$'
    );
    
    if (!urlRegex.hasMatch(url)) {
      return 'Please enter a valid URL';
    }
    
    return null;
  }
}