import 'package:flutter/material.dart';
import 'package:json_tree/constants/app_strings.dart';
import 'package:json_tree/controllers/home_page_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

import '../models/json_tree_response_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    Future.microtask(() => context.read<HomePageController>().loadTree());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = context.watch<HomePageController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homePageTitle),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (homeController.isLoading) ...{
            const Center(
              child: CircularProgressIndicator(),
            )
          } else if (homeController.jsonTreeResponse.rawJson != null) ...{
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TreeView(
                  theme: TreeViewTheme(
                    // labelStyle: const TextStyle(
                    //   fontSize: 16,
                    //   letterSpacing: 0.1,
                    //   fontWeight: FontWeight.w800,
                    //   color: Colors.grey,
                    // ),
                    // parentLabelStyle: const  TextStyle(
                    //   fontSize: 16,
                    //   letterSpacing: 0.1,
                    //   fontWeight: FontWeight.w800,
                    //   color: Colors.blue,
                    // ),
                    // iconTheme: IconThemeData(
                    //   size: 18,
                    //   color: Colors.grey.shade800,
                    // ),
                    colorScheme: Theme.of(context).colorScheme,
                  ),
                  controller: TreeViewController(
                    children: homeController.jsonTreeResponse.rawJson
                            ?.map((rawObj) {
                          return Node(
                            key: rawObj.id.toString(),
                            label: rawObj.name.toString(),
                            children: rawObj.children?.map((child) {
                                  return Node(
                                    key: child.id.toString(),
                                    label: child.name.toString(),
                                    children: child.children?.map((subChild1) {
                                          return Node(
                                            key: subChild1.id.toString(),
                                            label: subChild1.name.toString(),
                                            children: subChild1.children
                                                    ?.map((subChild2) {
                                                  return Node(
                                                    key:
                                                        subChild2.id.toString(),
                                                    label: subChild2.name
                                                        .toString(),
                                                    children: subChild2.children
                                                            ?.map((subChild3) {
                                                          return Node(
                                                              key: subChild3.id
                                                                  .toString(),
                                                              label: subChild3
                                                                  .name
                                                                  .toString());
                                                        }).toList() ??
                                                        [],
                                                  );
                                                }).toList() ??
                                                [],
                                          );
                                        }).toList() ??
                                        [],
                                  );
                                }).toList() ??
                                [],
                          );
                        }).toList() ??
                        [],
                  ),
                ),
              ),
            )
          }
        ],
      ),
    );
  }

  // Color getColor(List<RawJson>? rawJson) {
  //   Color rawColor = Colors.grey;
  //   rawJson?.forEach((rawObj) {
  //     rawObj.children?.forEach((child) {
  //       if (child.packageAmount == 0) {
  //         rawColor = Colors.red;
  //       } else if (child.packageAmount! > 0 &&
  //           (child.totalAchievedIncome! >= (child.totalExpectedIncome ?? 0))) {
  //         rawColor = Colors.pink;
  //       } else if (child.packageAmount! > 0 &&
  //           child.totalAchievedIncome! < child.childTotalExpectedIncome!) {
  //         rawColor = Colors.green;
  //       }
  //       child.children?.forEach((subC1) {
  //         if (subC1.packageAmount == 0) {
  //           rawColor = Colors.red;
  //         } else if (subC1.packageAmount! > 0 &&
  //             subC1.totalAchievedIncome! >= subC1.totalExpectedIncome!) {
  //           rawColor = Colors.pink;
  //         } else if (subC1.packageAmount! > 0 &&
  //             subC1.totalAchievedIncome! < subC1.childTotalExpectedIncome!) {
  //           rawColor = Colors.green;
  //         }
  //         subC1.children?.forEach((subC2) {
  //           if (subC2.packageAmount == 0) {
  //             rawColor = Colors.red;
  //           } else if (subC2.packageAmount! > 0 &&
  //               subC2.totalAchievedIncome! >= subC2.totalExpectedIncome!) {
  //             rawColor = Colors.pink;
  //           } else if (subC2.packageAmount! > 0 &&
  //               subC2.totalAchievedIncome! < subC2.childTotalExpectedIncome!) {
  //             rawColor = Colors.green;
  //           }
  //           subC2.children?.forEach((subC3) {
  //             if (subC3.packageAmount == 0) {
  //               rawColor = Colors.red;
  //             } else if (subC3.packageAmount! > 0 &&
  //                 subC3.totalAchievedIncome! >= subC3.totalExpectedIncome!) {
  //               rawColor = Colors.pink;
  //             } else if (subC3.packageAmount! > 0 &&
  //                 subC3.totalAchievedIncome! <
  //                     subC3.childTotalExpectedIncome!) {
  //               rawColor = Colors.green;
  //             }
  //             subC3.children?.forEach((element) {
  //               if (element.packageAmount == 0) {
  //                 rawColor = Colors.red;
  //               } else if (element.packageAmount! > 0 &&
  //                   element.totalAchievedIncome! >=
  //                       element.totalExpectedIncome!) {
  //                 rawColor = Colors.pink;
  //               } else if (element.packageAmount! > 0 &&
  //                   element.totalAchievedIncome! <
  //                       element.childTotalExpectedIncome!) {
  //                 rawColor = Colors.green;
  //               }
  //             });
  //           });
  //         });
  //       });
  //     });
  //   });
  //   return rawColor;
  // }
}
