
import 'package:infrastructure/src/platform_info_api.dart';
import 'package:injectable/injectable.dart';

@Environment("dev")
@Environment("android")
@Injectable(as: PlatformInfo)
class AndroidInfo implements PlatformInfo {
  String platform = "I am Robot!";
}
