import 'dart:ui';

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Screens/CPA-Monthaly.dart';
import 'package:smokin_joes/Screens/View_Busines.dart';
import 'package:smokin_joes/Screens/add_business.dart';
import 'package:smokin_joes/Screens/daily_lottery_sold.dart';
import 'package:smokin_joes/Screens/invoice_page.dart';
import 'package:smokin_joes/Screens/view_vendors.dart';

import '../Screens/Daily Activity.dart';
import '../Screens/Documents/Documents.dart';
import '../Screens/Reports/Reports.dart';
import '../Screens/Reports/detailed_p&l_report.dart';
import '../Screens/Reports/money_left_over_report.dart';
import '../Screens/Reports/report_visuals.dart';
import '../Screens/Reports/standard_p&l_report.dart';
import '../Screens/bank_statement.dart';
import '../Screens/cpa_settings.dart';
import '../Screens/cpa_yearly.dart';
import '../Screens/missed_daily_activity.dart';
import '../Screens/view_users.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);
  static bool isActive = false;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String dropDownValue = 'CPA - Monthly';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 85.h),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: Drawer(
          backgroundColor: AppColors.background,
          child: Column(
            children: [
              SizedBox(
                height: 150.h,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    border: Border(
                      bottom: Divider.createBorderSide(context,
                          color: AppColors.background, width: 0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('Images/logo.svg'),
                      GestureDetector(
                        onTap: () {},
                        child: ImageIcon(
                          const AssetImage('Images/Drawer_Icons/hh.png'),
                          size: 30.r,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    iTems(
                      widget: ListTileItem(
                          title: "Dashboard",
                          iconImagePath:
                              "Images/Drawer_Icons/icons8_dashboard.png",
                          size: 25,
                          voidCallback: () {
                            setState(() {
                              AppDrawer.isActive = !AppDrawer.isActive;
                            });
                          }),
                    ),
                    iTems(
                        widget: SizedBox(
                      width: 300.w,
                      //  color: Colors.red,
                      child: drawerAccordion(
                          'CPA',
                          "Images/Drawer_Icons/icons8_send_letter.png",
                          35.r,
                          0, [
                        accordionButton('Monthly', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CpaMonthly()),
                          );
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        accordionButton('Yearly', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CpaYearly()),
                          );
                        })
                      ]),
                    )),
                    iTems(
                      widget: ListTileItem(
                        title: "View Vendors",
                        iconImagePath:
                            "Images/Drawer_Icons/icons8_person_female.png",
                        size: 25,
                        voidCallback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewVendors(),
                            ),
                          );
                        },
                      ),
                    ),
                    iTems(
                      widget: SizedBox(
                        width: 300.w,
                        //  color: Colors.red,
                        child: drawerAccordion('Business',
                            "Images/Drawer_Icons/icons8_business.png", 25, 6, [
                          accordionButton('Add Business', () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddBusiness()),
                            );
                          }),
                          SizedBox(
                            height: 15.h,
                          ),
                          accordionButton('View Business', () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => View_Business()),
                            );
                          }),
                        ]),
                      ),
                    ),
                    iTems(
                        widget: ListTileItem(
                            title: "Daily Activity",
                            iconImagePath:
                                "Images/Drawer_Icons/icons8_activity_feed.png",
                            size: 25,
                            voidCallback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Daily_Activity()),
                              );
                            })),
                    iTems(
                      widget: ListTileItem(
                          title: "Daily Lottery Sold",
                          iconImagePath: "Images/Drawer_Icons/icons8_today.png",
                          size: 25.r,
                          voidCallback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        DailyLotterySold())));
                          }),
                    ),
                    iTems(
                        widget: SizedBox(
                      width: 300.w,
                      //  color: Colors.red,
                      child: drawerAccordion(
                          'Reports',
                          "Images/Drawer_Icons/icons8_combo_chart.png",
                          25.r,
                          8, [
                        accordionButton('Vendor Check Data', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Reports()),
                          );
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        accordionButton('Detailed P&L', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedPLReport(),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        accordionButton('Standard P&L', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StandardPLReport(),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        accordionButton('Money Left Over', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MoneyLeftOverReport(),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        accordionButton('Report Visual', () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportVisuals()));
                        })
                      ]),
                    )),
                    iTems(
                      widget: ListTileItem(
                        title: "View Users",
                        iconImagePath: "Images/Drawer_Icons/icons8_user.png",
                        size: 25,
                        voidCallback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewUsers(),
                            ),
                          );
                        },
                      ),
                    ),
                    iTems(
                      widget: ListTileItem(
                        title: "Invoices",
                        iconImagePath: "Images/Drawer_Icons/icons8_receipt.png",
                        size: 25,
                        voidCallback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InvoicePage(),
                            ),
                          );
                        },
                      ),
                    ),
                    iTems(
                      widget: ListTileItem(
                        title: "Bank Statements",
                        iconImagePath:
                            "Images/Drawer_Icons/icons8_petition.png",
                        size: 25,
                        voidCallback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BankStatement(),
                            ),
                          );
                        },
                      ),
                    ),
                    iTems(
                      widget: ListTileItem(
                        title: "Documents",
                        iconImagePath:
                            "Images/Drawer_Icons/icons8_documents.png",
                        size: 25,
                        voidCallback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Documents(),
                            ),
                          );
                        },
                      ),
                    ),
                    iTems(
                        widget: ListTileItem(
                            title: "Missed Daily Activity",
                            iconImagePath:
                                "Images/Drawer_Icons/icons8_query.png",
                            size: 25,
                            voidCallback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MissedDailyActivity(),
                                ),
                              );
                            })),
                    iTems(
                        widget: ListTileItem(
                            title: "CPA Settings",
                            iconImagePath: "Images/icons8-settings.png",
                            size: 25,
                            voidCallback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CpaSettings(),
                                ),
                              );
                            }))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Accordion drawerAccordion(String title, String iconImagePath, double iconSize,
      double padding, var items) {
    return Accordion(
        headerBorderRadius: 0,
        contentBorderRadius: 0,
        paddingListBottom: 0,
        flipRightIconIfOpen: true,
        rightIcon: const Icon(Icons.keyboard_arrow_down),
        paddingListTop: 10,
        headerPadding: EdgeInsets.symmetric(vertical: 0, horizontal: padding),
        children: [
          AccordionSection(
            contentBorderRadius: 0,
            isOpen: false,
            leftIcon: ImageIcon(
              AssetImage(iconImagePath),
              color: AppColors.secondary,
              size: iconSize,
            ),
            headerBackgroundColor: Colors.white,
            header: Row(
              children: [
                SizedBox(
                  width: 18.w,
                ),
                DrawerItem(title: title),
              ],
            ),
            content: Column(children: items),
            contentHorizontalPadding: 10,
            contentBorderWidth: 0,
            contentBorderColor: AppColors.primary,
            contentBackgroundColor: AppColors.primary,
          ),
        ]);
  }

  InkWell accordionButton(String title, VoidCallback voidCallback) {
    return InkWell(
      onTap: voidCallback,
      child: SizedBox(
        width: 1.sw,
        child: Row(
          children: [
            SizedBox(
              width: 58.w,
            ),
            // listTimeItem.drawerItem(title),
            DrawerItem(title: title),
          ],
        ),
      ),
    );
  }
}

class ListTileItem extends StatefulWidget {
  const ListTileItem(
      {Key? key,
      required this.title,
      required this.iconImagePath,
      required this.size,
      required this.voidCallback})
      : super(key: key);
  final String title;
  final String iconImagePath;
  final double size;
  final VoidCallback voidCallback;

  @override
  State<ListTileItem> createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: ListTile(
        leading: ImageIcon(
          AssetImage(widget.iconImagePath),
          color: AppColors.secondary,
          size: widget.size.r,
        ),
        title: DrawerItem(title: widget.title),
        onTap: () {
          widget.voidCallback();
          setState(() {
            isActive = true;
          });
        },
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;

  const DrawerItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppText(
        title: title,
        color: AppColors.secondary,
        size: 13.sp,
        fontWeight: FontWeight.w500);
  }
}

class iTems extends StatelessWidget {
  const iTems({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10.w,
        ),
        CircleAvatar(
          backgroundColor:
              AppDrawer.isActive == true ? AppColors.tertiary : Colors.white,
          radius: 5.r,
        ),
        widget
      ],
    );
  }
}
