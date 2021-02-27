class FirebaseAuthException implements Exception {
  final String message;
  FirebaseAuthException(this.message);
  @override
  String toString(){
    return message;
  }
}