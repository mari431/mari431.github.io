import 'package:flutter/material.dart';
import 'package:marimuthu_portfolio/widgets/logo/logo.dart';


class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      // decoration: kHederDecoration,
      child: Row(
        children: [
          // SiteLogo(
          //   onTap: onLogoTap,
          // ),
          Logo_wdget(
            onTap: () {
            },),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}