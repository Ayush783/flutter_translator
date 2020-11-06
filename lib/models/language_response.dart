class LanguageResponse {
  final String languageCode, error, language;

  LanguageResponse(this.languageCode, this.language, this.error);

  LanguageResponse.fromError()
      : languageCode = 'none',
        language = 'none',
        error = 'error';
}
