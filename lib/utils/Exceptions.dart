class ResquestsException implements Exception {
  ResquestsException(this.code, this.message);

  final String code;
  final String message;
}

class ApiException implements Exception {
  ApiException(this.code, this.message);

  final String code;
  final String message;
}