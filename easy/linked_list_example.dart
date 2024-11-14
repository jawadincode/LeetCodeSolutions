import 'dart:io';

class Node {
  int data;
  Node? next;

  Node(this.data);
}

Node? head;

void main() {
  while (true) {
    print("\n\n****** MENU ******");
    print("1. Insert");
    print("2. Display");
    print("3. Delete");
    print("4. Exit");
    stdout.write("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write("Enter the value to be inserted: ");
        int value = int.parse(stdin.readLineSync()!);
        insertMenu(value);
        break;
      case 2:
        display();
        break;
      case 3:
        deleteMenu();
        break;
      case 4:
        exit(0);
      default:
        print("\nWrong input!!! Try again!!\n");
    }
  }
}

void insertMenu(int value) {
  while (true) {
    print("Where do you want to insert:");
    print("1. At Beginning");
    print("2. At End");
    print("3. Between");
    stdout.write("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        insertAtBeginning(value);
        return;
      case 2:
        insertAtEnd(value);
        return;
      case 3:
        stdout.write("Enter the two values where you want to insert: ");
        int loc1 = int.parse(stdin.readLineSync()!);
        int loc2 = int.parse(stdin.readLineSync()!);
        insertBetween(value, loc1, loc2);
        return;
      default:
        print("\nWrong Input!! Try again!!!\n");
    }
  }
}

void insertAtBeginning(int value) {
  Node newNode = Node(value);
  if (head == null) {
    newNode.next = null;
    head = newNode;
  } else {
    newNode.next = head;
    head = newNode;
  }
  print("\nOne node inserted!!!");
}

void insertAtEnd(int value) {
  Node newNode = Node(value);
  newNode.next = null;
  if (head == null) {
    head = newNode;
  } else {
    Node temp = head!;
    while (temp.next != null) {
      temp = temp.next!;
    }
    temp.next = newNode;
  }
  print("\nOne node inserted!!!");
}

void insertBetween(int value, int loc1, int loc2) {
  Node newNode = Node(value);
  if (head == null) {
    newNode.next = null;
    head = newNode;
  } else {
    Node temp = head!;
    while (temp.data != loc1 && temp.data != loc2) {
      if (temp.next == null) break;
      temp = temp.next!;
    }
    newNode.next = temp.next;
    temp.next = newNode;
  }
  print("\nOne node inserted!!!");
}

void deleteMenu() {
  print("How do you want to delete:");
  print("1. From Beginning");
  print("2. From End");
  print("3. Specific");
  stdout.write("Enter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      removeBeginning();
      break;
    case 2:
      removeEnd();
      break;
    case 3:
      stdout.write("Enter the value which you want to delete: ");
      int delValue = int.parse(stdin.readLineSync()!);
      removeSpecific(delValue);
      break;
    default:
      print("\nWrong Input!! Try again!!!\n");
  }
}

void removeBeginning() {
  if (head == null) {
    print("\n\nList is Empty!!!");
  } else {
    Node temp = head!;
    if (head!.next == null) {
      head = null;
    } else {
      head = temp.next;
    }
    print("\nOne node deleted!!!\n\n");
  }
}

void removeEnd() {
  if (head == null) {
    print("\nList is Empty!!!\n");
  } else {
    Node? temp1 = head!, temp2;
    if (head!.next == null) {
      head = null;
    } else {
      while (temp1?.next != null) {
        temp2 = temp1;
        temp1 = temp1?.next!;
      }
      temp2?.next = null;
    }
    print("\nOne node deleted!!!\n\n");
  }
}

void removeSpecific(int delValue) {
  Node? temp1 = head, temp2;
  while (temp1 != null && temp1.data != delValue) {
    if (temp1.next == null) {
      print("\nGiven node not found in the list!!!");
      return;
    }
    temp2 = temp1;
    temp1 = temp1.next;
  }
  if (temp1 != null) {
    temp2?.next = temp1.next;
    print("\nOne node deleted!!!\n\n");
  }
}

void display() {
  if (head == null) {
    print("\nList is Empty\n");
  } else {
    Node temp = head!;
    print("\n\nList elements are - ");
    while (temp.next != null) {
      stdout.write("${temp.data} ---> ");
      temp = temp.next!;
    }
    stdout.write("${temp.data} --->NULL\n");
  }
}
