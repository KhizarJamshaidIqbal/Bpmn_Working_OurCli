// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, prefer_const_constructors_in_immutables
import 'package:bpm/ControllerProvider/sugerprovider/selectedstateprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugerchartprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugervalueprovider.dart';
import 'package:bpm/View/screen/suger/updatesuger.dart';
import 'package:bpm/services/sugerServices.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class SugerRecordList extends StatefulWidget {
  SugerRecordList({super.key});

  @override
  State<SugerRecordList> createState() => _SugerRecordListState();
}

class _SugerRecordListState extends State<SugerRecordList> {
  int colorCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Consumer<SugerValueProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.sugerProviderList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (colorCounter != 5) {
                colorCounter++;
              } else {
                colorCounter = 0;
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 2,
                        onPressed: (context) async {
                          await SugerServices.deleteItem(
                              value.sugerProviderList[index].id);
                          value.removeItem(value.sugerProviderList[index].id);
                          final chartProvider = Provider.of<SugerChartProvider>(
                              context,
                              listen: false);
                          chartProvider.setChart(context);
                        },
                        backgroundColor: value.sugerProviderList[index].mgddl <
                                70
                            ? globalColors.ColorsList[0]
                            : value.sugerProviderList[index].mgddl >= 72 &&
                                    value.sugerProviderList[index].mgddl <= 98
                                ? globalColors.ColorsList[1]
                                : value.sugerProviderList[index].mgddl >= 99 &&
                                        value.sugerProviderList[index].mgddl <=
                                            125
                                    ? globalColors.ColorsList[2]
                                    : value.sugerProviderList[index].mgddl >=
                                            125
                                        ? globalColors.ColorsList[3]
                                        : globalColors.ColorsList[4],
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'delete',
                      ),
                    ],
                  ),
                  child: Container(
                    height: 101,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 17,
                              decoration: BoxDecoration(
                                  color: value.sugerProviderList[index].mgddl <
                                          70
                                      ? globalColors.ColorsList[0]
                                      : value.sugerProviderList[index].mgddl >=
                                                  72 &&
                                              value.sugerProviderList[index]
                                                      .mgddl <=
                                                  98
                                          ? globalColors.ColorsList[1]
                                          : value.sugerProviderList[index]
                                                          .mgddl >=
                                                      99 &&
                                                  value.sugerProviderList[index]
                                                          .mgddl <=
                                                      125
                                              ? globalColors.ColorsList[2]
                                              : value.sugerProviderList[index]
                                                          .mgddl >=
                                                      125
                                                  ? globalColors.ColorsList[3]
                                                  : globalColors.ColorsList[4],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                "${value.sugerProviderList[index].time},${value.sugerProviderList[index].date}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 17),
                              ),
                              Spacer(),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  value.sugerProviderList[index].mgddl < 70
                                      ? "Low"
                                      : value.sugerProviderList[index].mgddl >=
                                                  72 &&
                                              value.sugerProviderList[index]
                                                      .mgddl <=
                                                  98
                                          ? "Normal"
                                          : value.sugerProviderList[index]
                                                          .mgddl >=
                                                      99 &&
                                                  value.sugerProviderList[index]
                                                          .mgddl <=
                                                      125
                                              ? "Pre-Diabetes"
                                              : value.sugerProviderList[index]
                                                          .mgddl >=
                                                      125
                                                  ? "Diabetes"
                                                  : "Diabetes",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              Spacer(),
                              Text(
                                  "Storage:${value.sugerProviderList[index].sateName}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    final selectedSateProvider =
                                        Provider.of<SelectedSateProvider>(
                                            context,
                                            listen: false);
                                    selectedSateProvider.setSelectedState(
                                        stateName: value
                                            .sugerProviderList[index].sateName,
                                        mgDlvalue: value
                                            .sugerProviderList[index].mgddl);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UpdateSuger(
                                                mgddl: value
                                                    .sugerProviderList[index]
                                                    .mgddl
                                                    .toString(),
                                                date: value
                                                    .sugerProviderList[index]
                                                    .date,
                                                id: value
                                                    .sugerProviderList[index]
                                                    .id,
                                                time: value
                                                    .sugerProviderList[index]
                                                    .time)));
                                  },
                                  child: Icon(Icons.edit_note_rounded)),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Row(
                                children: [
                                  Text("mgddl",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                      "${value.sugerProviderList[index].mgddl}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18))
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: globalColors.Gray_Background,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
