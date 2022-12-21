import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_school_management_admin_panel/features/domain/usecases/teacher_firebase_ucecases/create_teacher_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/teacher_entity.dart';
import '../../../domain/usecases/upload_teacher_image_usecase.dart';
part  'teacher_state.dart';


class TeacherCubit extends Cubit<TeacherState> {
  final CreateTeacherUseCase? createTeacherUseCase;
  final UploadImageToStorageUseCase uploadTeacherImageUseCase;

  TeacherCubit({
    required this.createTeacherUseCase,
    required this.uploadTeacherImageUseCase,
  }) : super(TeacherInitial());

  Future<void> createTeacher({required TeacherEntity teacher}) async {
    try {
      await createTeacherUseCase!.call(teacher);
    } on FirebaseException catch(_) {
      emit(TeacherFailure());
    } catch (_) {
      emit(TeacherFailure());
    }
  }

  Future<String> uploadImage({required Uint8List filePath, required String storagePath}) async {
    return await uploadTeacherImageUseCase.call(filePath, storagePath);
  }

}