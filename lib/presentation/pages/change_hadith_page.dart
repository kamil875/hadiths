import 'package:flutter/material.dart';
import 'package:hadiths/core/style/app_styles.dart';
import 'package:hadiths/domain/entities/hadith_entity.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../data/state/hadith_data_state.dart';

class ChangeHadithPage extends StatefulWidget {
  const ChangeHadithPage({
    super.key,
    required this.hadithModel,
  });

  final HadithEntity hadithModel;

  @override
  State<ChangeHadithPage> createState() => _ChangeHadithPageState();
}

class _ChangeHadithPageState extends State<ChangeHadithPage> {
  late final TextEditingController _hadithNumberController;
  late final TextEditingController _hadithTitleController;
  late final TextEditingController _hadithArabicController;
  late final TextEditingController _hadithTranslationController;

  @override
  void initState() {
    _hadithNumberController = TextEditingController(text: widget.hadithModel.hadithNumber);
    _hadithTitleController = TextEditingController(text: widget.hadithModel.hadithTitle);
    _hadithArabicController = TextEditingController(text: widget.hadithModel.hadithArabic);
    _hadithTranslationController = TextEditingController(text: widget.hadithModel.hadithTranslation);
    super.initState();
  }

  @override
  void dispose() {
    _hadithNumberController.dispose();
    _hadithTitleController.dispose();
    _hadithArabicController.dispose();
    _hadithTranslationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hadithModel.hadithNumber),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              autofocus: true,
              controller: _hadithNumberController,
              decoration:
                  const InputDecoration(hintText: AppStrings.enterNumberHadith),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 3,
              controller: _hadithTitleController,
              decoration:
                  const InputDecoration(hintText: AppStrings.enterTitleHadith),
            ),
            const SizedBox(height: 8),
            TextField(
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontFamily: 'Uthmanic',
              ),
              maxLines: 25,
              controller: _hadithArabicController,
              decoration:
                  const InputDecoration(hintText: AppStrings.enterArabicHadith),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 25,
              controller: _hadithTranslationController,
              decoration: const InputDecoration(
                  hintText: AppStrings.enterTranslationHadith),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                final mapHadith = <String, dynamic>{
                  'hadith_number': _hadithNumberController.text.trim(),
                  'hadith_title': _hadithTitleController.text.trim(),
                  'hadith_arabic': _hadithArabicController.text.trim(),
                  'hadith_translation':
                      _hadithTranslationController.text.trim(),
                  'name_audio': 'nameAudio',
                  'favorite_state': 0,
                };
                bool checkIsEmpty = _hadithNumberController.text.isNotEmpty && _hadithTitleController.text.isNotEmpty && _hadithArabicController.text.isNotEmpty && _hadithTranslationController.text.isNotEmpty;
                bool checkIseEquality = _hadithNumberController.text != widget.hadithModel.hadithNumber || _hadithTitleController.text != widget.hadithModel.hadithTitle || _hadithArabicController.text != widget.hadithModel.hadithArabic || _hadithTranslationController.text != widget.hadithModel.hadithTranslation;
                if (checkIsEmpty && checkIseEquality) {
                  Provider.of<HadithDataState>(context, listen: false).changeHadith(hadithId: widget.hadithModel.id, mapHadith: mapHadith);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 350),
                      backgroundColor: appColors.secondary,
                      content: const Text(
                        AppStrings.changed,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: const Text(AppStrings.change),
            ),
          ],
        ),
      ),
    );
  }
}
