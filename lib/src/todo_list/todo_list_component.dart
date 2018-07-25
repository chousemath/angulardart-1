import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'todo_list_service.dart';

class Item {
  String title;
  String description;
  Item(this.title, this.description);
}

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [const ClassProvider(TodoListService)],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  List<Item> items = [];
  List<Item> trashcan = [];
  String title = '';
  String description = '';

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    // items = await todoListService.getTodoList();
  }

  void add() {
    if (title == '' || description == '') return;
    print('I was clicked!');
    items.add(new Item(title, description));
    title = '';
    description = '';
  }

  Item remove(int index) {
    Item removedItem = items.removeAt(index);
    trashcan.add(removedItem);
    return removedItem;
  }

  Item removePermanent(int index) => trashcan.removeAt(index);
}
