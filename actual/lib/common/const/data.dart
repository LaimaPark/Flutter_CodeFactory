import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';


/* Emulator 는 Network가 다르다! */
// localhost 와 같은 ip = 10.0.2.2
final emulatorIp = '10.0.2.2:3000';
final simulatorIp = '127.0.0.1:3000';
final ip = Platform.isIOS ? simulatorIp : emulatorIp; /* Platform 은 꼭 dart:io 에서 불러야함 */



// 전체적으로 쓰기 위해서 이쪽으로 이동
final storage = FlutterSecureStorage();