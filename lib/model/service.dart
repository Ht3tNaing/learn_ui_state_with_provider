class Services {
  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 10));
    return "Data loaded.";
  }
}
