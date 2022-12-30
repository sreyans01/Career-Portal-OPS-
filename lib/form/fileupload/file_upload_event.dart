import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

abstract class FileUploadEvent extends Equatable {
  FileUploadEvent();
}

class FileUploadStartEvent extends FileUploadEvent {
  final FileType fileType;
  final bool allowMultiple;

  FileUploadStartEvent(
      {this.fileType = FileType.any, this.allowMultiple = false});

  @override
  List<Object> get props => [fileType];
}

class FileUploadSuccessEvent extends FileUploadEvent {
  final String url;

  FileUploadSuccessEvent({required this.url});

  @override
  List<Object> get props => [this.url];
}

class FileUploadFailureEvent extends FileUploadEvent {
  final String errorMessage;

  FileUploadFailureEvent({required this.errorMessage});

  @override
  List<Object> get props => [this.errorMessage];
}

class FileUploadSelectedEvent extends FileUploadEvent {
  final dynamic file;

  //This can be either of the two types: file or Uint8List
  FileUploadSelectedEvent({required this.file});

  @override
  List<Object> get props => [file];
}

class BackPressedEvent extends FileUploadEvent {
  @override
  List<Object> get props => [];
}

class FlieUploadCancelEvent extends FileUploadEvent {
  @override
  List<Object> get props => [];
}
