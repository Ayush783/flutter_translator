class TextResponse {
  final String text, error;

  TextResponse(this.text, this.error);

  TextResponse.fromError(String error)
      : text = '',
        error = error;
}
