import 'package:dio/dio.dart';
import 'package:ops_portal/constants.dart';
import 'package:ops_portal/utils/utils.dart';

/**
 * Client for managing requests that are having issues with retrofit currently.
 * For e.g - For flutter web, we need to use this client to send file in MultipartFile format or List<int> or Uint8List as there is a limitation that we cannot get the path.
 *
 */
class FileUploadClient {

  /**
   * @param route - Route path to the api
   * @param
   */
   Future<String?> uploadFile(String route, String fieldname, List<int> file, {String filename = "filename", String baseUrl = Constants.BASE_URL}) async {
    FormData formData = FormData.fromMap({
      fieldname : MultipartFile.fromBytes(
        file,
        filename: filename,
      )
    });
    var dio = Dio();
    dio.options.contentType = "multipart/form-data";
    var response =  await dio.post(baseUrl + route, data: formData).catchError((e)=> throw e).then((value) => value);
    return response.data;
  }
}