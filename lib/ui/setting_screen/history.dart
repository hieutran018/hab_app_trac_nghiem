import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history_detail_single_game.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  static String route = '/historyscreen';

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  final List<String> items = [
    'Thử Thách',
    'Thách Đấu',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        leading: const BackButton(
          color: ColorApp.black,
        ),
        title: Container(
          width: 250.w,
          height: 60.h,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.white),
            color: ColorApp.blue,
            borderRadius: BorderRadius.circular(24.w),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0.w, 3.w, 0.w, 3.w),
            child: Center(
              child: Text(
                "Lịch sử trò chơi",
                style:
                    GoogleFonts.inter(color: ColorApp.white, fontSize: 30.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Tùy chọn',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorApp.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: ColorApp.white,
                    iconDisabledColor: ColorApp.darkGrey,
                    buttonHeight: 50.h,
                    buttonWidth: 300.w,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: ColorApp.black,
                      ),
                      color: ColorApp.lightRed2251,
                    ),
                    buttonElevation: 2,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 250.h,
                    dropdownWidth: 300.w,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: ColorApp.lightRed2251,
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 10.h),
            child: const Divider(
              color: ColorApp.darkGrey,
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(8.w),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(HistoryDetailSingleGame.route);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: ColorApp.lightBlue,
                        ),
                        child: SizedBox(
                            width: 300.w,
                            height: 150.h,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          "Thắng",
                                          style: GoogleFonts.inter(
                                              color: ColorApp.lightBlue5125,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 40.sp),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: Text(
                                        "Thử thách",
                                        style: GoogleFonts.inter(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                          color: ColorApp.darkBlue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 120.w),
                                  child: Text(
                                    "100",
                                    style: GoogleFonts.inter(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorApp.darkBlue,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 60.w),
                                  child: Text(
                                    "00:10:03",
                                    style: GoogleFonts.inter(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorApp.darkBlue,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 60.w),
                                  child: Text(
                                    "26/10/2022",
                                    style: GoogleFonts.inter(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorApp.darkBlue,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
