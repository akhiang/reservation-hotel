class Validation {
  String validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Harus Diisi';
    }
    return null;
  }
}
