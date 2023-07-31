/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/colors.dart';

class SettingsList {
  static var List = [
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Utility')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Inventory')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Profit')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Maintenance')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Tax')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Pay Roll')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('ATM Commission')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('CIG Buy Down')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Credit Card Fee')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Franchise Fee')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Insurance')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Management Fee')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Remoduling(Equipment Purchase)')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Remoduling(Maintenance)')),
        DataCell(SwitchButton()),
      ],
    ),
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Rent')),
        DataCell(SwitchButton()),
      ],
    ),
  ];
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      child: Transform.scale(
        scale: 0.8.r,
        child: CupertinoSwitch(
          value: _switchValue,
          activeColor: AppColors.tertiary,
          trackColor: Color(0xffE11941),
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
      ),
    );
  }
}
*/
