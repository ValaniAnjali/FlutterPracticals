import 'package:flutter/material.dart';
import 'package:practical10/db_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  // Refresh data from database
  void _refreshData() async {
    try {
      final data = await SQLHelper.getAllData();
      setState(() {
        _allData = data;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Initialize state
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  // Create data
  Future<void> _addData() async {
    await SQLHelper.createData(_titleController.text, _descController.text);
    _refreshData();
  }

  // Update data
  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, _titleController.text, _descController.text);
    _refreshData();
  }

  // Delete data
  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Data Deleted Successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
    _refreshData();
  }

  // Show bottom sheet for add/edit
  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descController.text = existingData['desc'];
    } else {
      _titleController.clear();
      _descController.clear();
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _descController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Description",
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addData();
                  } else {
                    await _updateData(id);
                  }
                  _titleController.clear();
                  _descController.clear();
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    id == null ? "Add Data" : "Update",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      appBar: AppBar(
        title: const Text('SQLite CRUD'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _allData.isEmpty
              ? Center(child: Text("No data available."))
              : ListView.builder(
                  itemCount: _allData.length,
                  itemBuilder: (context, index) => Card(
                    margin: EdgeInsets.all(15),
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          _allData[index]['title'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      subtitle: Text(_allData[index]['desc']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              showBottomSheet(_allData[index]['id']);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.indigo,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _deleteData(_allData[index]['id']);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: Icon(Icons.add), // Fixed: Add icon
      ),
    );
  }
}
