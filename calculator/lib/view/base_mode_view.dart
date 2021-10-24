import 'package:calculator/asset/constant/button.dart';
import 'package:calculator/components/button.dart';
import 'package:calculator/lib/framework.dart';
import 'package:calculator/view_model/base_mode_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseModeState extends BaseMVVMState<BaseModeView, BaseModeViewModel> {
  @override
  Widget buildChild(ctx, BaseModeViewModel vm) {
    return SafeArea(
        child: Column(
      children: [
        Text(vm.output),
        NumberPad(
          vm: vm,
        ),
      ],
    ));
  }

  @override
  BaseModeViewModel buildViewModel() {
    return BaseModeViewModel();
  }
}

class BaseModeView extends StatefulWidget {
  const BaseModeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BaseModeState();
}

class NumberPad extends StatelessWidget {
  final BaseModeViewModel vm;

  const NumberPad({Key? key, required this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(children: [
      Row(
          children: vm.firstRow
              .map((label) => CustomElevatedButton(
                    text: label,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      Row(
          children: vm.secondRow
              .map((label) => CustomElevatedButton(
                    text: label,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      Row(
          children: vm.thirdRow
              .map((label) => CustomElevatedButton(
                    text: label,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      Row(
          children: vm.fourthRow
              .map((label) => CustomElevatedButton(
                    text: label,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      Row(
          children: vm.fifthRow
              .map((label) => CustomElevatedButton(
                    text: label,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
    ]);
  }
}
