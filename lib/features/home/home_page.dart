import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/common/extensions/extensions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.primary, AppColors.secundary],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(500, 30),
                    bottomRight: Radius.elliptical(500, 30),
                  )),
              height: 287.h,
            ),
          ),
          Positioned(
              left: 24,
              right: 24,
              top: 74.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Boa tarde',
                        // ignore: deprecated_member_use
                        textScaleFactor: textScaleFactor,
                        style: AppTextStyles.smallText
                            .apply(color: AppColors.white),
                      ),
                      Text(
                        'André Braga',
                        // ignore: deprecated_member_use
                        textScaleFactor: textScaleFactor,
                        style: AppTextStyles.smallText
                            .apply(color: AppColors.white),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      color: AppColors.white.withOpacity(0.06),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0.5, -0.5),
                      children: [
                        const Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.white,
                        ),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: AppColors.notification,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
              left: 24,
              right: 24,
              top: 155.h,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 32.h,
                ),
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Balanço Total',
                              // ignore: deprecated_member_use
                              textScaleFactor: textScaleFactor,
                              style: AppTextStyles.smallText
                                  .apply(color: AppColors.white),
                            ),
                            Text(
                              'R\$10000,00',
                              // ignore: deprecated_member_use
                              textScaleFactor: textScaleFactor,
                              style: AppTextStyles.mediumText
                                  .apply(color: AppColors.white),
                            ),
                          ],
                        ),
                        GestureDetector(
                          // ignore: avoid_print
                          onTap: () => print('opçoes'),
                          child: PopupMenuButton(
                            padding: EdgeInsets.zero,
                            child: const Icon(
                              Icons.more_horiz,
                              color: AppColors.white,
                            ),
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                  height: 24.0, child: Text('Item 1'))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 36.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Receitas',
                                  // ignore: deprecated_member_use
                                  textScaleFactor: textScaleFactor,
                                  style: AppTextStyles.smallText
                                      .apply(color: AppColors.white),
                                ),
                                Text(
                                  'R\$10000,00',
                                  // ignore: deprecated_member_use
                                  textScaleFactor: textScaleFactor,
                                  style: AppTextStyles.smallText
                                      .apply(color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_downward,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 4.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Despesas',
                                  // ignore: deprecated_member_use
                                  textScaleFactor: textScaleFactor,
                                  style: AppTextStyles.smallText
                                      .apply(color: AppColors.white),
                                ),
                                Text(
                                  'R\$10000,00',
                                  // ignore: deprecated_member_use
                                  textScaleFactor: textScaleFactor,
                                  style: AppTextStyles.smallText
                                      .apply(color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Positioned(
              top: 387.h,
              left: 0,
              width: 0,
              bottom: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Histórico',
                          // ignore: deprecated_member_use
                          textScaleFactor: textScaleFactor,
                          style: AppTextStyles.smallText
                              .apply(color: AppColors.white),
                        ),
                        Text(
                          'Todos',
                          // ignore: deprecated_member_use
                          textScaleFactor: textScaleFactor,
                          style: AppTextStyles.smallText
                              .apply(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final colorF =
                            index % 2 == 0 ? Colors.green : Colors.red;
                        final value =
                            index % 2 == 0 ? "+ R\$100,00" : "- R\$100,00";
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          leading: Container(
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.monetization_on_outlined,
                            ),
                          ),
                          title: const Text(
                            'Cartão',
                            style: AppTextStyles.smallText,
                          ),
                          subtitle: const Text(
                            'Hoje',
                            style: AppTextStyles.smallText,
                          ),
                          trailing: Text(
                            value,
                            style: AppTextStyles.smallText.apply(color: colorF),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
