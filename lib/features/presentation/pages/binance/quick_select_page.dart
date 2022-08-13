import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/providers/binance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/binance/bet.dart';
import '../../../domain/entities/binance/quick_select.dart';

class QuickSelectPage extends StatefulWidget {
  const QuickSelectPage({Key? key}) : super(key: key);

  @override
  _QuickSelectPageState createState() => _QuickSelectPageState();
}

class _QuickSelectPageState extends State<QuickSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Select"),
      ),
      body: SafeArea(
        child: _mainWidget(Provider.of<BinanceProvider>(context, listen:false).quickSelects),
      ),
    );
    // return _mainWidget();
  }

  Widget _mainWidget(List<QuickSelect> quickSelects){
    return Column(
      children: [
        //SizedBox(height: 24.0,),
        //Text("Quick Select", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
        Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 16/9,
              physics: BouncingScrollPhysics(),
              children: [
                ...List.generate(quickSelects.length, (index) => SubmitButton(callback: (){
                  // set quick selection
                  Provider.of<BinanceProvider>(context, listen:false).setQuickSelect(quickSelects[index]);
                  // close dialog
                  Navigator.pop(context);
                }, text: quickSelects[index].name)).toList()
              ],
          ),
        ),
      ],
    );
    return Column(
      children: [
        SizedBox(height: 24.0,),
        Text("Quick Select", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),

        ...List.generate(quickSelects.length, (index) => SubmitButton(callback: (){
          // set quick selection
          Provider.of<BinanceProvider>(context, listen:false).setQuickSelect(quickSelects[index]);
          // close dialog
          Navigator.pop(context);
        }, text: quickSelects[index].name)).toList()
      ],
    );
  }

  /*

SubmitButton(callback: (){Navigator.pop(context);}, text: "အကြီး"),
        SubmitButton(callback: (){Navigator.pop(context);}, text: "အငယ်"),
        SubmitButton(callback: (){Navigator.pop(context);}, text: "အပူး"),
        SubmitButton(callback: (){Navigator.pop(context);}, text: "နတ်ခက်"),
        SubmitButton(callback: (){Navigator.pop(context);}, text: "၁ ပတ်"),
        SubmitButton(callback: (){Navigator.pop(context);}, text: "၂ ပတ်"),
        */
}
