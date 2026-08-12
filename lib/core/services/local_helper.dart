import 'package:hive/hive.dart';

class LocalHelper {
static  late  Box userBox ;
static String kName = 'name';
static String kImage = 'image';
static String kIsUpload = 'isupload';


 static init()async {
  await Hive.openBox('userBox');
    userBox = Hive.box('userBox');
  }
  static putData(String key, dynamic value){
    userBox.put(key, value);
  }
  static getData(String key){
    return userBox.get(key);
  }
  static putlocaldata(String key, String image){
     putData(LocalHelper.kName, key);
    putData(LocalHelper.kImage, image);
    putData(LocalHelper.kIsUpload, true);
  }
}