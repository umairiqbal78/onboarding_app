import 'package:get_storage/get_storage.dart';

class XLocalStorage{
  static final XLocalStorage  _instance = XLocalStorage._internal();
  var storage = GetStorage();
  factory XLocalStorage(){
    return _instance;
  }
  XLocalStorage._internal();


  writeData<T>(String key, T value) async {
    return await storage.write(key,value);
  }

  readData(String key) {
   return storage.read(key);
  }

  removeData<T>(String key)async {
   return await storage.remove(key);
  }

  clearAll()async {
    return await storage.erase();
  }

}