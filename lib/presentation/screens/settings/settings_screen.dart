import 'package:fgpt_ai/config/constants/constants.dart';
import 'package:fgpt_ai/config/themes/themes.dart';
import 'package:fgpt_ai/presentation/bloc/gpt_model/gpt_model_bloc.dart';
import 'package:fgpt_ai/presentation/bloc/user/user_bloc.dart';
import 'package:fgpt_ai/presentation/router/router.dart';
import 'package:fgpt_ai/presentation/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/theme/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: AppFontSize.titleSmall,
              ),
        ),
        titleSpacing: -5,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 20,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onPressed: () {
              AppNavigator.pop(context);
            }),
      ),
      body: Padding(
        padding: AppPadding.commonScreenPadding,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    leading: Icon(
                      state.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      size: 20.sp,
                    ),
                    title: Text(
                      "Dark Mode",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: AppFontWeight.medium,
                          ),
                    ),
                    trailing: const SizedBox(
                      width: 50,
                      child: ThemeSwitch(
                        size: 15,
                      ),
                    ),
                  );
                },
              ),
              WhiteSpace.gapH20,
              const GptModelViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class GptModelViewWidget extends StatelessWidget {
  const GptModelViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GptModelBloc, GptModelState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Text(
                    "Gpt Processing Model",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: AppFontWeight.medium,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: state is GptModelLoading
                      ? SizedBox(
                          height: 20.sp,
                          width: 20.sp,
                          child: const CircularProgressIndicator(
                            color: Palette.primary,
                            strokeWidth: 2,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            context.read<GptModelBloc>().add(GetAllGptModels(
                                context: context, doReload: true));
                          },
                          child: Icon(
                            Icons.replay,
                            size: 20,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                ),
              ],
            );
          },
        ),
        WhiteSpace.gapH20,
        BlocBuilder<GptModelBloc, GptModelState>(
          builder: (context, state) {
            if (state is GptModelSuccess) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    return ListTile(
                      onTap: () {
                        context
                            .read<UserBloc>()
                            .add(SetNewModel(state.allModels[index]));
                      },
                      shape: userState.model != null &&
                              userState.model!.id == state.allModels[index].id
                          ? RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                color: Palette.primary,
                                width: 1,
                              ))
                          : null,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      dense: true,
                      title: Text(
                        state.allModels[index].id,
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                    );
                  },
                ),
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: state.allModels.length,
              );
            }
            if (state is GptModelError) {
              return Center(
                child: Text(
                  state.error.message,
                  style: Theme.of(context).textTheme.bodySmall!,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
