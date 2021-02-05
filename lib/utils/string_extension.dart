extension StringExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get titleCase {
    if (isEmpty || this == ' ') return this;
    return this
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
