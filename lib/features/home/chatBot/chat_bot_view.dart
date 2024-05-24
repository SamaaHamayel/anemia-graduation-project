import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../setting/presentation/settings_cubit/settings_cubit.dart';
import 'chat_bot_screen.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? const AssetImage(
              'lib/core/utils/appImages/images/backgroundDark.png')
              : const AssetImage(
              'lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        title: const Text(
          'EyeNemia Chatbot',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: ChatBotViewBody(),
      ),
    );
  }
}