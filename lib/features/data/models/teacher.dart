import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_school_management_admin_panel/features/domain/entities/teacher_entity.dart';

class Teacher extends TeacherEntity {
  final String? teacherName;
  final String? teacherEmail;
  final String? teacherPassword;
  final String? teacherDesignation;
  final String? teacherDepartment;
  final String? teacherPhoneNumber;
  final String? teacherGender;
  final String? teacherBloodGroup;
  final String? teacherAddress;
  final String? teacherAbout;
  final String? teacherImage;


  const Teacher({
    this.teacherName,
    this.teacherEmail,
    this.teacherPassword,
    this.teacherDesignation,
    this.teacherDepartment,
    this.teacherPhoneNumber,
    this.teacherGender,
    this.teacherBloodGroup,
    this.teacherAddress,
    this.teacherAbout,
    this.teacherImage
  }) : super (
      teacherName: teacherName,
      teacherEmail: teacherEmail,
      teacherPassword: teacherPassword,
      teacherDesignation: teacherDesignation,
      teacherDepartment: teacherDepartment,
      teacherPhoneNumber: teacherPhoneNumber,
      teacherGender: teacherGender,
      teacherBloodGroup: teacherBloodGroup,
      teacherAddress: teacherAddress,
      teacherAbout: teacherAbout,
      teacherImage: teacherImage,
  );

  factory Teacher.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, String>;

    return Teacher(
      teacherName: snapshot['teacherName'],
      teacherEmail: snapshot['teacherEmail'],
      teacherPassword: snapshot['teacherPassword'],
      teacherDesignation: snapshot['teacherDesignation'],
      teacherDepartment: snapshot['teacherDepartment'],
      teacherPhoneNumber: snapshot['teacherPhoneNumber'],
      teacherGender: snapshot['teacherGender'],
      teacherBloodGroup: snapshot['teacherBloodGroup'],
      teacherAddress: snapshot['teacherAddress'],
      teacherAbout: snapshot['teacherAbout'],
      teacherImage: snapshot['teacherImage'],
    );
  }

  Map<String, String> toJson() => {
    "teacherName": teacherName!,
    "teacherEmail": teacherEmail!,
    "teacherPassword": teacherPassword!,
    "teacherDesignation": teacherDesignation!,
    "teacherDepartment": teacherDepartment!,
    "teacherPhoneNumber": teacherPhoneNumber!,
    "teacherGender": teacherGender!,
    "teacherBloodGroup": teacherBloodGroup!,
    "teacherAddress": teacherAddress!,
    "teacherAbout": teacherAbout!,
    "teacherImage": teacherImage!,
  };
}