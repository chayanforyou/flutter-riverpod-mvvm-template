extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNullOrBlank => this == null || this!.trim().isEmpty;

  bool get isValidEmail {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    return emailRegex.hasMatch(this ?? '');
  }

  String capitalize() {
    return this != null ? this!
        .split(' ')
        .map((word) => word.isNotEmpty ? word[0].toUpperCase() + word.substring(1).toLowerCase() : '')
        .join(' ') : '';
  }
}