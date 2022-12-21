import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_school_management_admin_panel/features/domain/entities/teacher_entity.dart';
import 'package:flutter_school_management_admin_panel/features/domain/repository/firebase_repository.dart';

import '../data_sources/remote_data/remote_data_source.dart';

class TeacherFirebaseRepositoryImpl extends TeacherFirebaseRepository {

  final RemoteDataSource remoteDataSource;

  TeacherFirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createTeacher(TeacherEntity teacher) async => remoteDataSource.createTeacher(teacher);

  @override
  Stream<List<TeacherEntity>> getSingleOtherTeacher(String otherUid) {
    // TODO: implement getSingleOtherTeacher
    throw UnimplementedError();
  }

  @override
  Stream<List<TeacherEntity>> getSingleTeacher(String uid) {
    // TODO: implement getSingleTeacher
    throw UnimplementedError();
  }

  @override
  Stream<List<TeacherEntity>> getTeachers(TeacherEntity teacher) {
    // TODO: implement getTeachers
    throw UnimplementedError();
  }

  @override
  Future<void> updateTeacher(TeacherEntity teacher) {
    // TODO: implement updateTeacher
    throw UnimplementedError();
  }

  @override
  Future<String> uploadImageToStorage(Uint8List filePath, String storagePath) => remoteDataSource.uploadImageToStorage(filePath, storagePath);
  
}