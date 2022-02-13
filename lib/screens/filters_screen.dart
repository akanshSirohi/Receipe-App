import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters-screen";

  final Function(Map<String, bool>) updateFilters;
  final Map<String, bool> _filters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();

  FiltersScreen(this._filters, this.updateFilters);
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = (widget._filters['gluten'] as bool);
    _vegetarian = (widget._filters['vegetarian'] as bool);
    _vegan = (widget._filters['vegan'] as bool);
    _lactoseFree = (widget._filters['lactose'] as bool);
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool c_value, Function(bool) onChange) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: c_value,
      onChanged: onChange,
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                };
                widget.updateFilters(selectedFilters);
                Navigator.of(context).popAndPushNamed("/");
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluten Free",
                  "Only include gluten-free meals",
                  _glutenFree,
                  (nV) => setState(() => _glutenFree = nV),
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Only include vegetarian meals",
                  _vegetarian,
                  (nV) => setState(() => _vegetarian = nV),
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meals",
                  _vegan,
                  (nV) => setState(() => _vegan = nV),
                ),
                _buildSwitchListTile(
                  "Lactose Free",
                  "Only include lactose-free meals",
                  _lactoseFree,
                  (nV) => setState(() => _lactoseFree = nV),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
