import 'package:flutter_school_management_admin_panel/features/domain/entities/teacher_entity.dart';
import 'package:flutter_school_management_admin_panel/features/domain/repository/firebase_repository.dart';

class CreateTeacherUseCase {
  final TeacherFirebaseRepository repository;

  CreateTeacherUseCase({required this.repository});

  Future<void> call(TeacherEntity teacher) {
    return repository.createTeacher(teacher);
  }
}