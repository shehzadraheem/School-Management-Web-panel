import 'dart:typed_data';

import '../../../domain/entities/teacher_entity.dart';

abstract class RemoteDataSource {

  // Teacher Features
  Stream<List<TeacherEntity>> getTeachers(TeacherEntity teacher);
  Stream<List<TeacherEntity>> getSingleTeacher(String uid);
  Stream<List<TeacherEntity>> getSingleOtherTeacher(String otherUid);
  Future<void> createTeacher(TeacherEntity teacher);
  Future<void> updateTeacher(TeacherEntity teacher);

  // Upload Teacher Image
  Future<String> uploadImageToStorage(Uint8List filePath, String storagePath);
}