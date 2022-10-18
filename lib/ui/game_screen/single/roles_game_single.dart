import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RolesSingleGame extends StatelessWidget {
  const RolesSingleGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromRGBO(33, 150, 243, 1)),
        borderRadius: BorderRadius.circular(30.w),
      ),
      title: Container(
        width: 120.w,
        height: 40.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          color: const Color.fromRGBO(169, 255, 139, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Thể lệ phần chơi THỬ THÁCH",
            style: GoogleFonts.inter(
              color: const Color.fromRGBO(64, 82, 238, 1),
              fontSize: 20.w,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500.w,
          child: Column(children: [
            Text(
              "1. Trò chơi được chia làm 2 phần chơi: Chơi đơn và Thách đấu.",
              style: TextStyle(fontSize: 20.w),
            ),
            Text(
              "2. Người chơi có tối đa ba lượt chơi trong cùng một thời điểm và được tính cho cả phần chơi đơn và phần chơi thách đấu.",
              style: TextStyle(fontSize: 20.w),
            ),
            Text(
              "3. Mỗi giờ người chơi sẽ được thêm một lượt chơi và số lần được cộng thêm là không giới hạn.",
              style: TextStyle(fontSize: 20.w),
            ),
            Text(
              "4. Người chơi ghi điểm bằng cách trả lời câu hỏi của phần chơi đơn hoặc phần chơi thách đấu",
              style: TextStyle(fontSize: 20.w),
            ),
            Text(
              "5. Tùy vào phần chơi hệ thống sẽ có cách tính điểm riêng biệt và bảng xếp hạng riêng biệt sẽ vinh danh 20 người có điểm số cao nhất với phần chơi tương ứng.",
              style: TextStyle(fontSize: 20.w),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 108.w,
                  height: 33.w,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromRGBO(5, 0, 255, 1)),
                    color: const Color.fromRGBO(139, 213, 255, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(
                          color: const Color.fromRGBO(5, 0, 255, 1),
                          fontSize: 20.w),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
