
import 'dart:typed_data';

import '../repository/firebase_repository.dart';

class UploadImageToStorageUseCase {
  final TeacherFirebaseRepository repository;

  UploadImageToStorageUseCase({required this.repository});

  Future<String> call(Uint8List filePath, String storagePath) {
    return repository.uploadImageToStorage(filePath, storagePath);
  }
}