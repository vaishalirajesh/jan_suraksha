import 'package:http/http.dart';
import 'package:jan_suraksha/services/request/tg_request.dart';

abstract class TGUploadRequest extends TGRequest {
  MultipartFile file();
}
