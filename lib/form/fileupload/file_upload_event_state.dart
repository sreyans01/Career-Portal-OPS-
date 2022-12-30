import 'package:equatable/equatable.dart';

abstract class FileUploadState extends Equatable {
  FileUploadState();
}

class FileUploadNotInitializedState extends FileUploadState {
  FileUploadNotInitializedState();

  @override
  List<Object> get props => [];
}

class FileUploadStartState extends FileUploadState {
  FileUploadStartState();

  @override
  List<Object> get props => [];
}

class FileUploadNotSelectedState extends FileUploadState {
  FileUploadNotSelectedState();

  @override
  List<Object> get props => [];
}

class FileUploadSelectedState extends FileUploadState {
  final dynamic file;

  FileUploadSelectedState({required this.file});

  @override
  List<Object> get props => [file];
}

class FileUploadSuccessState extends FileUploadState {
  final String url;

  FileUploadSuccessState({required this.url});

  @override
  List<Object> get props => [url];
}

class FileUploadFailedState extends FileUploadState {
  final String errorMessage;

  FileUploadFailedState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class FileUploadLoadingState extends FileUploadState {
  final FileUploadState state;

  FileUploadLoadingState({required this.state});

  @override
  List<Object> get props => [state];
}
