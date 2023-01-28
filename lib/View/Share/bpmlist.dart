// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, prefer_const_constructors_in_immutables
import 'package:bpm/ControllerProvider/bpprovider/avgbpprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/bpchartprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/latestbpprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/maxbpprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/minbpprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:bpm/View/screen/bloodpreasure/updatebloodprease.dart';
import 'package:bpm/services/sqlite_service.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class BpmList extends StatefulWidget {
  BpmList({super.key});

  @override
  State<BpmList> createState() => _BpmListState();
}

class _BpmListState extends State<BpmList> {
  int colorCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Consumer<SugerProvider>(
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
                          await SqliteService.deleteItem(
                              value.sugerProviderList[index].id);
                          value.removeItem(value.sugerProviderList[index].id);
                          final maxBpProvider =
                              Provider.of<MaxBpProvier>(context, listen: false);
                          final avgBpProvider =
                              Provider.of<AvgBpProvier>(context, listen: false);
                          final minBpProvider =
                              Provider.of<MinBpProvier>(context, listen: false);
                          final latestBpProvider = Provider.of<LatestBpProvier>(
                              context,
                              listen: false);
                          final bpChartProvider = Provider.of<BpChartProvider>(
                              context,
                              listen: false);
                          maxBpProvider.setMaxBp(context: context);
                          avgBpProvider.setAvgBp(context: context);
                          minBpProvider.setMinBp(context: context);
                          latestBpProvider.setLatestBp(context: context);
                          bpChartProvider.setChart(context);
                        },
                        backgroundColor: value
                                        .sugerProviderList[index].sysTolic <
                                    120 &&
                                value.sugerProviderList[index].diasTolic < 80
                            ? globalColors.ColorsList[0]
                            : value.sugerProviderList[index].sysTolic >= 120 &&
                                    value.sugerProviderList[index].sysTolic <=
                                        129 &&
                                    value.sugerProviderList[index].diasTolic <
                                        80
                                ? globalColors.ColorsList[1]
                                : value.sugerProviderList[index].sysTolic >
                                            130 &&
                                        value.sugerProviderList[index].sysTolic <
                                            140 &&
                                        value.sugerProviderList[index].diasTolic >
                                            80 &&
                                        value.sugerProviderList[index].diasTolic <
                                            90
                                    ? globalColors.ColorsList[2]
                                    : value.sugerProviderList[index]
                                                    .sysTolic <
                                                180 &&
                                            value.sugerProviderList[index]
                                                    .sysTolic >
                                                140 &&
                                            value.sugerProviderList[index]
                                                    .diasTolic >
                                                90 &&
                                            value.sugerProviderList[index]
                                                    .diasTolic >
                                                120
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
                                  color: value.sugerProviderList[index].sysTolic < 120 &&
                                          value.sugerProviderList[index].diasTolic <
                                              80
                                      ? globalColors.ColorsList[0]
                                      : value.sugerProviderList[index].sysTolic >= 120 &&
                                              value.sugerProviderList[index].sysTolic <=
                                                  129 &&
                                              value.sugerProviderList[index].diasTolic <
                                                  80
                                          ? globalColors.ColorsList[1]
                                          : value.sugerProviderList[index].sysTolic > 130 &&
                                                  value.sugerProviderList[index].sysTolic <
                                                      140 &&
                                                  value.sugerProviderList[index]
                                                          .diasTolic >
                                                      80 &&
                                                  value.sugerProviderList[index]
                                                          .diasTolic <
                                                      90
                                              ? globalColors.ColorsList[2]
                                              : value.sugerProviderList[index].sysTolic < 180 &&
                                                      value.sugerProviderList[index].sysTolic >
                                                          140 &&
                                                      value.sugerProviderList[index].diasTolic >
                                                          90 &&
                                                      value.sugerProviderList[index].diasTolic >
                                                          120
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
                                "Pulse: ${value.sugerProviderList[index].pulse} BPM",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 17),
                              ),
                              Spacer(),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  value.sugerProviderList[index].sysTolic < 120 &&
                                          value.sugerProviderList[index].diasTolic <
                                              80
                                      ? "Normal Blood Pressure"
                                      : value.sugerProviderList[index].sysTolic >= 120 &&
                                              value.sugerProviderList[index]
                                                      .sysTolic <=
                                                  129 &&
                                              value.sugerProviderList[index]
                                                      .diasTolic <
                                                  80
                                          ? "Elivated Blood Pressure"
                                          : value.sugerProviderList[index].sysTolic > 130 &&
                                                  value.sugerProviderList[index]
                                                          .sysTolic <
                                                      140 &&
                                                  value.sugerProviderList[index]
                                                          .diasTolic >
                                                      80 &&
                                                  value.sugerProviderList[index]
                                                          .diasTolic <
                                                      90
                                              ? "High Blood Pressure Stage-II"
                                              : value.sugerProviderList[index]
                                                              .sysTolic <
                                                          180 &&
                                                      value.sugerProviderList[index].sysTolic >
                                                          140 &&
                                                      value.sugerProviderList[index]
                                                              .diasTolic >
                                                          90 &&
                                                      value.sugerProviderList[index].diasTolic > 120
                                                  ? "Dangerously High Blood Pressure"
                                                  : "Dangerously High Blood Pressure",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              Spacer(),
                              Text(
                                  "${value.sugerProviderList[index].time}, ${value.sugerProviderList[index].date}",
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateBloodPreasure(
                                                  id: value
                                                      .sugerProviderList[index]
                                                      .id
                                                      .toString(),
                                                  sysvalue: index,
                                                  diavalue: index,
                                                  plusevalue: index,
                                                  date:
                                                      value
                                                          .sugerProviderList[
                                                              index]
                                                          .date,
                                                  time: value
                                                      .sugerProviderList[index]
                                                      .time),
                                        ));
                                  },
                                  child: Icon(Icons.edit_note_rounded)),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                      "${value.sugerProviderList[index].sysTolic}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                      "${value.sugerProviderList[index].diasTolic}",
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
