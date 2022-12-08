// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ploff/utils/colors/colors.dart';
// import 'package:ploff/utils/style/text_style.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSize {
//   final String title;
//   final PreferredSizeWidget? bottom;
//   final bool notTabBar;
//   final SvgPicture? trailingImage;
//   final VoidCallback? onTap;
//   const CustomAppBar({
//     Key? key,
//     required this.title,
//     required this.notTabBar,
//     this.trailingImage,
//     this.bottom,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: PloffColors.white,
//       centerTitle: true,
//       title: Text(title),
//       actions: [
//         IconButton(
//           icon: trailingImage ?? const SizedBox(),
//           onPressed: trailingImage != null ? onTap : null,
//         ),
//         SizedBox(width: 5),
//       ],
//       bottom: bottom,
//     );
//   }

//   @override
//   Widget get child => throw UnimplementedError();

//   @override
//   Size get preferredSize => Size(double.infinity, notTabBar ? 69 : 120);
// }
