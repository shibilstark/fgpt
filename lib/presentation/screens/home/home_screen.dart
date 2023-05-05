import 'package:fgpt_ai/config/constants/constants.dart';
import 'package:fgpt_ai/config/themes/palette.dart';
import 'package:fgpt_ai/presentation/bloc/theme/theme_bloc.dart';
import 'package:fgpt_ai/presentation/widgets/keyboard_dismisser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/theme_switch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyBoardDismisser(
          focusNode: FocusScope.of(context),
          child: Column(
            children: const [
              HomeAppBarWidget(),
              Expanded(
                child: Padding(
                  padding: AppPadding.commonScreenPadding,
                  child: HomeChatsViewWidget(),
                ),
              ),
              HomeChatFieldWidget(),
              // ThemeSwitch()
            ],
          ),
        ),
      ),
    );
  }
}

class HomeChatsViewWidget extends StatelessWidget {
  const HomeChatsViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Palette.primary,
                radius: 12.sp,
                child: Icon(
                  Icons.person,
                  color: Palette.white,
                  size: 20.sp,
                ),
              ),
              WhiteSpace.gapW10,
              Expanded(
                child: Text(
                  "What is Flutter Development",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: AppFontSize.bodySmall,
                        fontWeight: AppFontWeight.medium,
                      ),
                ),
              )
            ],
          ),
          WhiteSpace.gapH5,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.sp),
                child: CircleAvatar(
                  backgroundColor: Palette.primary,
                  radius: 12.sp,
                  child: Icon(
                    Icons.computer_rounded,
                    color: Palette.white,
                    size: 15.sp,
                  ),
                ),
              ),
              WhiteSpace.gapW10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10.sp),
                      child: Text(
                        "Flutter is an open-source software development kit which enables smooth and easy cross-platform mobile app development. You can build high quality natively compiled apps for iOS and Android quickly, without having to write the code for the two apps separately.",
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                    ),
                    WhiteSpace.gapH5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 15,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        WhiteSpace.gapW10,
                        Icon(
                          Icons.thumb_down_outlined,
                          size: 15,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        WhiteSpace.gapW5,
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      separatorBuilder: (context, index) => WhiteSpace.gapH25,
      itemCount: 10,
    );
  }
}

class HomeChatFieldWidget extends StatelessWidget {
  const HomeChatFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Row(
        children: [
          Expanded(
            child: CustomAppTextFieldWidget(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              hint: "Ask something..",
            ),
          ),
          WhiteSpace.gapW10,
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return CircleAvatar(
                radius: 20,
                backgroundColor:
                    state.isDarkMode ? Palette.textBlack : Palette.primary,
                child: Icon(
                  Icons.send,
                  color: Palette.white,
                  size: 20.sp,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class CustomAppTextFieldWidget extends StatelessWidget {
  const CustomAppTextFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.hint = "",
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        focusNode: focusNode,
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: AppFontSize.bodySmall,
              color: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .color!
                  .withOpacity(0.6)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
              width: 0.5,
            ),
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
      ),
    );
  }
}

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "FGPT",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: AppFontWeight.bold,
                    fontSize: AppFontSize.titleLarge,
                  ),
            ),
            InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.settings,
                ))
          ],
        ),
      ),
    );
  }
}
