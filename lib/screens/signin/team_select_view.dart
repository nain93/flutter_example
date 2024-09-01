import 'package:flutter/material.dart';
import 'package:flutter_example/constants/constants.dart';
import 'package:flutter_example/providers/auth_provider.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class TeamListType {
  final String name;
  final bool isSelected;
  final String emblem;
  final Color mainColor;

  TeamListType(
    this.name,
    this.isSelected,
    this.emblem,
    this.mainColor,
  );
}

class TeamSelectView extends StatefulHookConsumerWidget {
  const TeamSelectView({
    super.key,
    required this.token,
  });
  final String token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamSelectViewState();
}

class _TeamSelectViewState extends ConsumerState<TeamSelectView> {
  List<TeamListType> teamList = Constants.teamList;

  var loading = false;

  @override
  Widget build(BuildContext context) {
    void onPressedComplete() async {
      setState(() {
        loading = true;
      });
      //  토큰 저장하고 메인화면으로 이동
      // TODO: 유저정보 저장
      await ref.read(authProviderProvider.notifier).signIn(widget.token);
      if (context.mounted) {
        context.go(GoRoutes.home.fullPath);
      }
      setState(() {
        loading = false;
      });
    }

    return Scaffold(
      appBar: const AppBarBack(
        title: '팀 선택',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemCount: teamList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var team = teamList[index];
                  return Material(
                    color: team.isSelected
                        ? Colors.transparent
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          teamList = teamList.map((e) {
                            var setIndex = teamList.indexOf(e);
                            if (index == setIndex) {
                              return TeamListType(
                                  e.name, true, e.emblem, e.mainColor);
                            }
                            return TeamListType(
                                e.name, false, e.emblem, e.mainColor);
                          }).toList();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: team.isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            width: team.isSelected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(team.emblem)),
                            const Gap(8),
                            Text(
                              team.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: team.isSelected
                                        ? Colors.black
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Button(
                loading: loading,
                disabled: teamList.every((element) => !element.isSelected),
                margin: const EdgeInsets.only(bottom: 20),
                text: '선택 완료',
                onPressed: onPressedComplete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
