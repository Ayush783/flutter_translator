class TranslatedText {
  final String text, error;

  TranslatedText(this.text, this.error);

  TranslatedText.fromError(String error)
      : text = '',
        error = error;
}
