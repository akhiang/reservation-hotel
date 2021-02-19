class Validation {
  static final _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final _numericOnlyRegex = RegExp(r"^[0-9 +]+$");

  String validateName(String value) {
    if (value.isEmpty) {
      return 'Nama belum diisi';
    } else if (value.length < 3) {
      return 'Nama Minimal 3 karakter';
    }
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email belum diisi';
    } else if (!_emailRegex.hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  String validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Nomor telepon belum diisi';
    } else if (!_numericOnlyRegex.hasMatch(value)) {
      return 'Nomor telepon hanya boleh diisi angka';
    } else if (value.length < 9) {
      return 'Nomor telepon minimal 9 karakter';
    }
    return null;
  }

  String validateAddress(String value) {
    if (value.isEmpty) {
      return 'Alamat belum diisi';
    } else if (value.length < 10) {
      return 'Alamat minimal 10 karakter';
    } else if (value.length > 20) {
      return 'Alamat maksimal 20 karakter';
    }
    return null;
  }

  String validateDateCard(String value) {
    if (value.isEmpty) {
      return 'Masa berlaku belum diisi';
    } else if (value.length < 10) {
      return 'Masa Berlaku minimal 10 karakter';
    } else if (value.length > 20) {
      return 'Masa Berlaku maksimal 20 karakter';
    }
    return null;
  }

  String validateCvcCard(String value) {
    if (value.isEmpty) {
      return 'CVC belum diisi';
    } else if (value.length < 10) {
      return 'CVC minimal 10 karakter';
    } else if (value.length > 20) {
      return 'CVC maksimal 20 karakter';
    }
    return null;
  }
}
