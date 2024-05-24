import 'dart:developer';
import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/appImages/app_assets.dart';
import '../setting/presentation/settings_cubit/settings_cubit.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> chatMessagesList = [];
  ChatUser currentUser = ChatUser(id: '1', firstName: 'Hadeer');
  ChatUser geminiUser =
  ChatUser(id: '0', firstName: 'EyeNemia');
  @override
  void initState() {
    super.initState();
    chatMessagesList = [
      ChatMessage(
        text: "Hello!! How can I help you today?",
        user: geminiUser,
        createdAt: DateTime.now(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? (AppAssets.backgroundDark)
                : (AppAssets.background),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          DashChat(
          currentUser: currentUser,
          onSend: sendMessage,
          messages: chatMessagesList,
          inputOptions: InputOptions(
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              hintText: 'Type a message...',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(FontAwesomeIcons.message,
                  color: AppColors.medicineNameColor, size: 20),
              enabledBorder: outlineInputBorder(),
              focusedBorder: outlineInputBorder(),
            ),
          ),
          messageOptions: const MessageOptions(
            showOtherUsersAvatar: false,
            messagePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            borderRadius: 16,
            textColor: Colors.white,
            currentUserTextColor: Colors.white,
            containerColor: Colors.green,
            currentUserContainerColor: AppColors.darkGreen,
          ),
          messageListOptions: const MessageListOptions(
            scrollPhysics: BouncingScrollPhysics(),
          ),
        )],
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.darkGreen,
        width: 1.8,
      ),
    );
  }

  void sendMessage(ChatMessage chatMessage) {
    setState(() {
      chatMessagesList = [chatMessage, ...chatMessagesList];
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        String response = event.content?.parts
            ?.fold("", (previous, current) => "$previous${current.text}") ??
            '';
        if (chatMessagesList.isNotEmpty &&
            chatMessagesList.first.user == geminiUser) {
          setState(() {
            chatMessagesList[0] = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: chatMessagesList[0].text + response,
            );
          });
        } else {
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            chatMessagesList = [message, ...chatMessagesList];
          });
        }
      });
    } catch (ex) {
      log(ex.toString());
    }
  }
}
