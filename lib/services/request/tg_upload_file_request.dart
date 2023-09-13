import 'package:http/http.dart';
import 'package:jan_suraksha/services/request/tg_request.dart';

abstract class TGUploadFileRequest extends TGRequest {
  MultipartFile file();

  Map<String, String> body();
}
