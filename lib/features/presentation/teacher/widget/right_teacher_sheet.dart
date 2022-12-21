import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_school_management_admin_panel/core/constant/app_text.dart';
import 'package:flutter_school_management_admin_panel/core/widgets/common_text_field.dart';
import 'package:flutter_school_management_admin_panel/features/data/models/teacher.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/teacher/bloc/teacher_cubit.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/teacher/widget/select_blood_group.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/teacher/widget/select_gender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_sized_boxes.dart';
import '../../../../core/constant/app_text_style.dart';


typedef GenderCallback = void Function(String? gender);
typedef BloodGroupCallback = void Function(String? group);


class RightTeacherSheet extends StatefulWidget {
  const RightTeacherSheet({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  State<RightTeacherSheet> createState() => _RightTeacherSheetState();
}

class _RightTeacherSheetState extends State<RightTeacherSheet> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _designationController;
  late TextEditingController _departmentController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _genderController;
  late TextEditingController _bloodGroupController;
  late TextEditingController _addressController;
  late TextEditingController _aboutController;

  final _formKey = GlobalKey<FormState>();
  Uint8List? _image;
  String? _imageName;
  String? selectedGender;
  String? bloodGroup;

  Future<void> selectImage() async {
    try {
      final pickedFile =
          await ImagePicker.platform.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = await XFile(pickedFile.path).readAsBytes();
        _imageName = pickedFile.name;
        setState(() {});
      } else {
        Fluttertoast.showToast(msg: "Image not selected");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Exception");
    }
  }

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _designationController = TextEditingController();
    _departmentController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _genderController = TextEditingController();
    _bloodGroupController = TextEditingController();
    _addressController = TextEditingController();
    _aboutController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _designationController.dispose();
    _departmentController.dispose();
    _phoneNumberController.dispose();
    _genderController.dispose();
    _bloodGroupController.dispose();
    _addressController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.createTeacher,
              style: AppTextStyles.bodyLg.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
            AppSizedBoxes.kSizedBoxHeight4,
            const Divider(
              color: AppColors.black,
            ),
            AppSizedBoxes.kSizedBoxHeight14,
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name
                  CommonTextField(
                    controller: _nameController,
                    label: AppText.labelName,
                    hint: AppText.enterTeacherName,
                    validator: (value) {
                      if (value!.length < 3) {
                        return AppText.nameError;
                      }
                      return null;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Email
                  CommonTextField(
                    controller: _emailController,
                    label: AppText.labelEmail,
                    hint: AppText.enterTeacherEmail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        if (!_checkValidEmail(value.toString())) {
                          return AppText.emailError;
                        }
                      } else {
                          return AppText.emailError;
                      }
                      return null;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Password
                  CommonTextField(
                    controller: _passwordController,
                    label: AppText.labelPassword,
                    hint: AppText.enterTeacherPassword,
                    obsecure: true,
                    validator: (value) {
                      if (value!.length < 5) {
                        return AppText.passwordError;
                      }
                      return null;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Designation
                  CommonTextField(
                    controller: _designationController,
                    label: AppText.labelDesignation,
                    hint: AppText.enterTeacherDesignation,
                    validator: (value) {
                      if (value!.length < 3) {
                        return AppText.designationError;
                      }
                      return null;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Department
                  CommonTextField(
                    controller: _departmentController,
                    label: AppText.labelDepartment,
                    hint: AppText.enterTeacherDepartment,
                    validator: (value) {
                      if (value!.length < 3) {
                        return AppText.departmentError;
                      }
                      return null;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Phone Number
                  CommonTextField(
                    controller: _phoneNumberController,
                    label: AppText.labelPhoneNumber,
                    hint: AppText.enterTeacherPhoneNumber,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.length < 9) {
                        return AppText.phoneError;
                      }
                      return null;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Gender
                  SelectGender(
                    genderCallback: (gender) {
                      selectedGender = gender;
                      print(selectedGender);
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Blood Group
                  const Text(AppText.selectBloodGroup),
                  SelectBloodGroup(
                    bloodGroupCallback: (group) {
                      bloodGroup = group;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Address
                  CommonTextField(
                    controller: _addressController,
                    label: AppText.labelAddress,
                    hint: AppText.enterTeacherAddress,
                    isMulti: true,
                    validator: (value) {
                      if (value!.length < 14) {
                        return AppText.addressError;
                      }
                      return null;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// About
                  CommonTextField(
                    controller: _aboutController,
                    label: AppText.labelAbout,
                    hint: AppText.enterTeacherAbout,
                    isMulti: true,
                    validator: (value) {
                      if (value!.length < 14) {
                        return AppText.aboutError;
                      }
                      return null;
                    },
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Image
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: AppColors.black.withOpacity(0.5)),
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            selectImage();
                          },
                          child: const Text(AppText.selectImage),
                        ),
                        AppSizedBoxes.kSizedBoxWidth6,
                        Text(
                          '$_imageName',
                          style: AppTextStyles.bodySm
                              .copyWith(overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                  AppSizedBoxes.kSizedBoxHeight14,

                  /// Save Teacher
                  SizedBox(
                    width: widget._size.width,
                    height: widget._size.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        _uploadImage(context, _image);
                      },
                      child: const Text(AppText.saveButton),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _uploadImage(context, Uint8List? image) {
    if (_formKey.currentState!.validate() && image != null) {
      _formKey.currentState!.save();

      BlocProvider.of<TeacherCubit>(context)
          .uploadTeacherImageUseCase(image, "image")
          .then((url) {
        _createTeacher(context, url);
      });

    } else {
      Fluttertoast.showToast(msg: "Have you selected image");
    }
  }

  void _createTeacher(context, String url) {
    BlocProvider.of<TeacherCubit>(context)
        .createTeacher(
      teacher: Teacher(
        teacherName: _nameController.text.toString(),
        teacherEmail: _emailController.text.toString(),
        teacherPassword: _passwordController.text.toString(),
        teacherDesignation: _designationController.text.toString(),
        teacherDepartment: _departmentController.text.toString(),
        teacherPhoneNumber: _phoneNumberController.text.toString(),
        teacherGender: selectedGender,
        teacherBloodGroup: bloodGroup,
        teacherAddress: _addressController.text.toString(),
        teacherAbout: _aboutController.text.toString(),
        teacherImage: url,
      ),
    ).then((value) {
      Fluttertoast.showToast(msg: "Added Successfully");
      Navigator.pop(context);
    }).catchError((e) {
      Fluttertoast.showToast(msg: "Error");
    });
  }

  bool _checkValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
