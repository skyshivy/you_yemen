class StoreManager {
  static final StoreManager _instance = StoreManager._internal();

  StoreManager._internal() {
    print("initiali stro manager");
  }

  factory StoreManager() {
    return _instance;
  }
  bool isEnglish = true;
}
