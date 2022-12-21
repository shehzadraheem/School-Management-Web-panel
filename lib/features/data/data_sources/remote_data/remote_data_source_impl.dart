import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_school_management_admin_panel/features/data/data_sources/remote_data/remote_data_source.dart';
import 'package:flutter_school_management_admin_panel/features/domain/entities/teacher_entity.dart';

import '../../models/teacher.dart';

class RemoteDataSourceImpl extends RemoteDataSource {

  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  RemoteDataSourceImpl({
    required this.firebaseStorage,
    required this.firebaseFirestore
  });

  @override
  Future<void> createTeacher(TeacherEntity teacher) async {
    final userCollection = firebaseFirestore.collection("teachers");

    final addTeacher = Teacher(
      teacherName: teacher.teacherName,
      teacherEmail: teacher.teacherEmail,
      teacherPassword: teacher.teacherPassword,
      teacherDesignation: teacher.teacherDesignation,
      teacherDepartment: teacher.teacherDepartment,
      teacherPhoneNumber: teacher.teacherPhoneNumber,
      teacherGender: teacher.teacherGender,
      teacherBloodGroup: teacher.teacherBloodGroup,
      teacherAddress: teacher.teacherAddress,
      teacherAbout: teacher.teacherAbout,
      teacherImage: teacher.teacherImage,
    ).toJson();

    userCollection.add(addTeacher);
  }

  @override
  Stream<List<TeacherEntity>> getSingleOtherTeacher(String otherUid) {
    throw UnimplementedError();
  }

  @override
  Stream<List<TeacherEntity>> getSingleTeacher(String uid) {
    throw UnimplementedError();
  }

  @override
  Stream<List<TeacherEntity>> getTeachers(TeacherEntity teacher) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTeacher(TeacherEntity teacher) {
    throw UnimplementedError();
  }

  @override
  Future<String> uploadImageToStorage(Uint8List filePath, String storagePath) async {
    const chars ='AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    String randomStr = String.fromCharCodes(Iterable.generate(
        8, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

    Reference ref = firebaseStorage.ref().child(storagePath).child(randomStr);

    UploadTask uploadTask = ref.putData(
      filePath,
      SettableMetadata(contentType: 'image/png'),
    );
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

}