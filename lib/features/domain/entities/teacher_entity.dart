import 'package:equatable/equatable.dart';


///  The [TeacherEntity] class extends the
///  Equatable class from the equatable package,
///  which provides methods for comparing objects.
class TeacherEntity extends Equatable {
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

  const TeacherEntity({
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
  });


  /// It overrides the props getter method from
  /// the [Equatable] class to return a list of
  /// all the class's fields.
  ///
  /// This enables the [Equatable] class to compare two
  /// [TeacherEntity] objects based on their field values.
  @override
  List<Object?> get props => [
    teacherName,
    teacherEmail,
    teacherPassword,
    teacherDesignation,
    teacherDepartment,
    teacherPhoneNumber,
    teacherGender,
    teacherBloodGroup,
    teacherAddress,
    teacherAbout,
    teacherImage
  ];
}
