import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/WebHandler/user_controller.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Card2.dart';
import 'package:smokin_joes/Widgets/Tables/view_user_table.dart';

import '../Widgets/AlertDialogue/edit_user_dialige.dart';
import '../Widgets/AlertDialogue/user_privilege_dialogue.dart';
import '../Widgets/search_textfield.dart';

class ViewUsers extends GetView<UsersController> {
  const ViewUsers({Key? key}) : super(key: key);

  static final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      key: _key,
      appBar: APPBAR(
        ontap: () {
          _key.currentState!.openDrawer();
        },
      ),
      drawer: const AppDrawer(),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              const CARD2(
                ImagePath: "Images/viewUsers.svg",
                title: 'View Users',
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: SearchTextField(
                  width: 1.sw,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: controller.viewUsersList.isEmpty
                    ? SizedBox(
                        height: 400.h,
                        width: 1.sw,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 1.8.sw,
                          child: ViewUserTable(
                            firstHeading: '#',
                            secondHeading: 'Username',
                            thirdHeading: 'Email',
                            fourthHeading: 'Business',
                            fifthHeading: 'Created On',
                            sixthHeading: 'Privilege',
                            sevenHeading: 'Action',
                            tableRowsLit: controller.viewUsersList[0].data,
                            firstHeaderWidth: 0.3,
                            firstRowWidth: 0.3,
                            secondHeaderWidth: 0.6,
                            secondRowWidth: 0.6,
                            fourthHeaderWidth: 1.2,
                            fourthRowWidth: 1.2,
                            fifthHeaderWidth: 0.5,
                            fifthRowWidth: 0.5,
                            sixthHeaderWidth: 0.5,
                            sixthRowWidth: 0.5,
                            sevenHeaderWidth: 0.6,
                            sevenRowWidth: 0.6,
                            voidCallback_1: (userEditData) {
                              controller.splitStringToList(
                                  userEditData["department_name"]);

                              log('User Id at Specific Index: ${userEditData['id']}');

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return EditUserDialogue(
                                      selectedValue: controller.selectedStore
                                          .toSet()
                                          .toList(),
                                      selectedStoreCallBack: (value) {
                                        log('Value: $value');
                                        controller.selectedStore.add(value);
                                        log('selected store list item: ${controller.selectedStore}');
                                      },
                                      updateCallBack: () async {
                                        controller.selectedStoreIds.clear();
                                        controller.isUpdated.value = false;
                                        for (int i = 0;
                                            i < controller.selectedStore.length;
                                            i++) {
                                          controller.findStoreId(
                                              controller.selectedStore[i]);
                                        }
                                        controller.multiselectItemsString =
                                            controller.selectedStoreIds
                                                .join(',');
                                        controller.viewUsersList.clear();
                                        Navigator.of(context).pop(true);

                                        await controller.updateUserBusiness(
                                            userID: userEditData['id'],
                                            departmentsIds: controller
                                                .multiselectItemsString);

                                        await controller.getUsers();

                                        controller.isUpdated.value == true
                                            ? Get.snackbar(
                                                "Business",
                                                "Updated Successfully",
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                              )
                                            : Get.snackbar(
                                                "Error",
                                                "During Business Updating",
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                              );
                                      },
                                    );
                                  });
                            },
                            voidCallback_2: (userData) {
                              controller.id = userData["id"];
                              if (userData["user_privileges"] == null) {
                                controller.privilegeDropDownValue.value =
                                    'Edit';
                              } else {
                                controller.privilegeDropDownValue.value =
                                    'View Only';
                              }
                              log('Id at the Index: ${controller.id}');

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return EditUserPrivilegeDialogue();
                                  });
                            },
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 70.h),
            ],
          ),
        ),
      ),
    );
  }
}
