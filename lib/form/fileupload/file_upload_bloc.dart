import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ops_portal/constants.dart';
import 'package:ops_portal/form/fileupload/file_upload_event.dart';
import 'package:ops_portal/form/fileupload/file_upload_event_state.dart';
import 'package:ops_portal/network/fileuploadclient.dart';
import 'package:ops_portal/network/form_client.dart';

class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  FileUploadBloc() : super(FileUploadNotInitializedState()) {
    on<FileUploadStartEvent>((event, emit) async {
      dynamic file = await pickFile(
          fileType: event.fileType, allowMultiple: event.allowMultiple);
      emit(FileUploadSelectedState(file: file));
      add(FileUploadSelectedEvent(file: file));
    });
    on<FileUploadSelectedEvent>((event, emit) async {
      dynamic file = event.file;
      if (file == null) {
        emit(FileUploadNotSelectedState());
      } else if (file is File) {
        String? url = await uploadFile(file);
        if (url == null)
          emit(FileUploadFailedState(
              errorMessage: "Error in uploading image to server"));
        else
          emit(FileUploadSuccessState(url: url));
      } else if (file is Uint8List) {
        String? url = await uploadFileInBytes(file);
        if (url == null)
          emit(FileUploadFailedState(
              errorMessage: "Error in uploading image to server"));
        else
          emit(FileUploadSuccessState(url: url));
      }
    });
  }

  @override
  FileUploadState get initialState => FileUploadNotInitializedState();

  /**
   * @param : fileType - (Optional) Specify the file type if any
   * @param : allowMultiple - (Optional) Set this as true if you want to allow multiple files to be selected
   */
  Future<dynamic> pickFile(
      {FileType fileType = FileType.any, bool allowMultiple = false}) async {
    File? file;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: fileType, allowMultiple: allowMultiple);
    if (result != null && result.files.first.bytes != null) {
      return result.files.first.bytes!;
    } else if (result != null && result.files.single.path != null) {
      file = File(result.files.single.path!);
      return file;
    }
    return file;
  }

  /**
   * Upload file to through api through this method
   * @param : file - The file to be uplaoded
   * @param : baseUrl - (Optional) Use this when need to update the base url for specific api calls.
   * @return - The url of the file if upload is successful, throws exception on error.
   */
  Future<String?> uploadFile(File file,
      {String baseUrl = Constants.BASE_URL}) async {
    var dio = await Dio();
    return FormClient(dio, baseUrl: baseUrl).uploadFile(file).catchError((e) => e).then((value) => value.file_url);
  }

  /**
   * When need to upload file in bytes, use this method.
   * Mostly used in cases when we don't get the path, e.g in Web.
   * @param : file - The file to be uploaded in Uint8List
   * @param : baseUrl - (Optional) Either use the default baseUrl for the api, or set it custom
   * @param : route - (Optional) Either use the default route for the api, or set it custom
   * @return - The url of the file if upload is successful, throws exception on error.
   */
  Future<String?> uploadFileInBytes(Uint8List fileBytes,
      {String baseUrl = Constants.BASE_URL,
      String route = "/upload",
      String fieldname = "source_file",
      String filename = "filename"}) async {
    return FileUploadClient()
        .uploadFile(route, fieldname, fileBytes)
        .catchError((e) => e).then((value) => value);
  }
}
