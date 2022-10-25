import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:stroke_text/stroke_text.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);
  static String route = '/newsDetail';
  @override
  State<NewsDetailScreen> createState() => NewsDetailScreenState();
}

class NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.lightBlue5125,
          leading: const BackButton(color: ColorApp.white),
          title: Image.asset(
            "assets/images/components/ic_logo_hab.png",
            width: 45.w,
            height: 55.w,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notification');
                },
                icon: Image.asset("assets/images/ic_notification.png"))
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(2.w, 2.w, 2.w, 0.w),
                child: Container(
                  height: 70.w,
                  color: ColorApp.blue,
                  child: Container(
                    height: 70.h,
                    color: ColorApp.blue,
                    child: Center(
                      child: Text(
                        'Tin tức khoa học',
                        style: GoogleFonts.inter(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                child: Text(
                  "Trạm Thiên Cung cân bằng nhiệt thế nào ở độ cao 400 km?",
                  style: GoogleFonts.inter(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorApp.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                child: const Text("Nguồn: VN Express"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(Icons.calendar_month_rounded, size: 20.sp),
                    ),
                    TextSpan(
                        text: "20/09/2022",
                        style:
                            TextStyle(color: ColorApp.black, fontSize: 20.sp)),
                  ]),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: Column(
                    children: [
                      const Text(
                          "TRUNG QUỐCNgoài không gian, trạm Thiên Cung có thể chịu những tia nhiệt 150 độ C ở phía hướng về Mặt Trời, nhưng phía sau chỉ là -100 độ C."),
                      Image.asset(
                          "assets/images/thumbnail/thumbnail_news_1.png"),
                      const Text(
                          "Bay quanh Trái Đất ở độ cao 400 km, trạm vũ trụ Thiên Cung của Trung Quốc phải hứng chịu ánh sáng Mặt Trời trực tiếp ngoài không gian do không có sự bảo vệ của khí quyển. Điều này đòi hỏi trạm phải trang bị những công nghệ phân phối nhiệt tiên tiến, CGTN hôm 9/9 đưa tin."),
                      const Text(
                          "Bề mặt của Thiên Cung có thể phải chịu những tia nhiệt lên tới 150 độ C khi hướng về phía Mặt Trời. Trong khi đó, nhiệt độ ở mặt sau giảm xuống -100 độ C. Vì vậy, hệ thống kiểm soát nhiệt đóng vai trò thiết yếu để duy trì môi trường thoải mái bên trong cabin."),
                      const Text(
                          "Hệ thống này giúp giữ cho mọi bộ phận của trạm vũ trụ ở trong phạm vi nhiệt độ phù hợp để vận hành, đồng thời tạo môi trường dễ chịu cho các phi hành gia sinh sống. Khác với những nhiệm vụ ngắn hạn của phi hành đoàn trước đây, trạm vũ trụ cần được sử dụng lâu dài, kèm theo đó là tiêu chuẩn về kiểm soát nhiệt độ cao hơn và nghiêm ngặt hơn."),
                      const Text(
                          "Mạch chất lỏng là phần quan trọng của hệ thống kiểm soát nhiệt vì nó bao quanh các module chính, bao gồm module lõi và module phòng thí nghiệm. Nhờ phân phối nhiệt cân bằng, hệ thống giúp làm mát phần quá nóng và làm ấm những nơi quá lạnh. Với chất lỏng lưu thông qua các ống, nhiệt lượng dư thừa do các bánh răng và phi hành gia tạo ra được chuyển đến thiết bị hoặc bộ phận khác."),
                    ],
                  ))
            ],
          ),
        ));
  }
}
