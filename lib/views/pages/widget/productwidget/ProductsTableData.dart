import 'package:ecommerceadmin/models/Product.dart';
import 'package:ecommerceadmin/widget/MyIconButton.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';



class ProductsTableData extends StatelessWidget {
  final List<Product> products;

  const ProductsTableData({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDataSource = ProductDataSource(products);
    return Container(
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.all(10),
      child: SfDataGrid(
        rowHeight: 100,
        source: productDataSource,
        allowFiltering: true,
        allowSorting: true,
        headerGridLinesVisibility: GridLinesVisibility.none,
        gridLinesVisibility: GridLinesVisibility.none,
        columns: [
          GridColumn(
            allowFiltering: false,
            width: 100,
            columnName: "id",
            label: Center(child: Text("ID")),
          ),
          GridColumn(
            allowFiltering: false,
            allowSorting: true,
            width: 150,
            columnName: "images",
            label: Center(child: Text("Image")),
          ),
          GridColumn(
            allowFiltering: false,
            allowSorting: true,
            width: 150,
            columnName: "name",
            label: Center(child: Text("Name")),
          ),
          GridColumn(
            allowFiltering: false,
            width: 150,
            columnName: "sellPrice",
            label: Center(child: Text("S Price")),
          ),
          GridColumn(
            allowFiltering: false,
            width: 100,
            columnName: "stock",
            label: Center(child: Text("Stock")),
          ),
          GridColumn(
            width: 150,
            allowSorting: false,
            columnName: "supplier",
            label: Center(child: Text("Seller")),
          ),
          GridColumn(
            allowSorting: false,
            width: 100,
            columnName: "unit",
            label: Center(child: Text("Unit")),
          ),
          GridColumn(
            allowSorting: false,
            allowFiltering: false,
            width: 100,
            columnName: "purchasePrice",
            label: Center(child: Text("Price")),
          ),
          GridColumn(
            allowSorting: false,
            width: 150,
            columnName: "isActive",
            label: Center(child: Text("Active")),
          ),
          GridColumn(
            allowSorting: false,
            allowFiltering: false,
            columnName: "action",
            label: Center(child: Text("Action")),
          ),
        ],
      ),
    );
  }
}

class ProductDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;

  ProductDataSource(List<Product> products) {
    dataGridRows = products.map((product) {
      return DataGridRow(cells: [
        DataGridCell(columnName: "id", value: product.id),
        DataGridCell(columnName: "images", value: product.images),
        DataGridCell(columnName: "name", value: product.name),
        DataGridCell(columnName: "sellPrice", value: product.sellPrice),
        DataGridCell(columnName: "stock", value: product.stock),
        DataGridCell(columnName: "supplier", value: product.supplier),
        DataGridCell(columnName: "unit", value: product.unit),
        DataGridCell(columnName: "purchasePrice", value: product.purchasePrice),
        DataGridCell(columnName: "isActive", value: product.isActive),
        DataGridCell(columnName: "action", value: product.tags),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        if (cell.columnName == "images") {
          List<String>? imageUrls = cell.value as List<String>?;
          String imageUrl = imageUrls != null && imageUrls.isNotEmpty ? imageUrls[0] : '';

          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.withOpacity(0.2),
            ),
            child: imageUrl.isNotEmpty
                ? Image.network(imageUrl, fit: BoxFit.cover)
                : Icon(Icons.image, size: 50, color: Colors.grey),
          );
        }
        if (cell.columnName == "isActive") {
          return Center(
            child: Text(
              cell.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: cell.value == true ? Colors.green : Colors.red,
              ),
            ),
          );
        }

        if (cell.columnName == "action") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyIconButton(
                onTap: () {  },
                icon: Icons.visibility,
                color: Colors.blue,
              ),
              MyIconButton(
                onTap: () {  },
                icon: Icons.edit,
                color: Colors.green,
              ),
              MyIconButton(

                icon: Icons.delete,
                color: Colors.red, onTap: () {  },
              ),
            ],
          );
        }
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(
            cell.value.toString(),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
