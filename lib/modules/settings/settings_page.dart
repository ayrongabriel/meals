import 'package:flutter/material.dart';
import 'package:meals/shareds/components/drawer/app_drawer.dart';
import 'package:meals/shareds/models/filters_model.dart';
import 'package:meals/shareds/theme/app_colors.dart';
import 'package:meals/shareds/theme/app_styles.dart';

class SettignsPage extends StatefulWidget {
  final Function(FiltersModel) onFilterChanged;
  final FiltersModel filter;
  final bool isActions;

  const SettignsPage(
      {required this.filter,
      required this.onFilterChanged,
      this.isActions = true,
      Key? key})
      : super(key: key);

  @override
  State<SettignsPage> createState() => _SettignsPageState();
}

class _SettignsPageState extends State<SettignsPage> {
  late FiltersModel filter;

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      activeColor: AppColors.primary,
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onFilterChanged(filter);
      },
    );
  }

  @override
  void initState() {
    filter = widget.filter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Filtros",
              style: AppStyles.titleBold,
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.grey800,
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                    'Sem Glúten',
                    'Só exibe refeições sem glúten!',
                    filter.isGlutenFree,
                    (value) => setState(() => filter.isGlutenFree = value)),
                _createSwitch(
                    'Sem lactose',
                    'Só exibe refeições sem lactose!',
                    filter.isLactoseFree,
                    (value) => setState(() => filter.isLactoseFree = value)),
                _createSwitch(
                    'Vegana',
                    'Só exibe refeições vegana!',
                    filter.isVegan,
                    (value) => setState(() => filter.isVegan = value)),
                _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetariana!',
                    filter.isVegetarian,
                    (value) => setState(() => filter.isVegetarian = value)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
